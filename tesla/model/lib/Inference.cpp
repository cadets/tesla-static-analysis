#include <llvm/IR/Instructions.h>
#include <llvm/Support/CFG.h>

#include "Inference.h"

/** Compute Strongest Inferences **/

Condition *Condition::BranchCondition(BasicBlock *pred, BasicBlock *succ) {
  auto term = pred->getTerminator();
  assert(isa<BranchInst>(term) && "Don't know what do do with non-branch term");

  auto nSucs = term->getNumSuccessors();
  assert((nSucs == 1 || nSucs == 2) && "Unusual number of successors");

  if(nSucs == 1) {
    return new ConstTrue;
  }

  auto val = term->getOperand(0);
  auto trueBB = term->getSuccessor(0);
  auto falseBB = term->getSuccessor(1);

  if(succ == trueBB) {
    return new Branch(val, true);
  } else if(succ == falseBB) {
    return new Branch(val, false);
  }

  assert(false && "Successor not actually a successor");
}

std::map<BasicBlock *, Condition *> Condition::StrongestInferences(Function *f) {
  if(f->isDeclaration()) {
    return {};
  }

  std::map<BasicBlock *, Condition *> ret;

  for(auto& bb : *f) {
    ret[&bb] = new ConstTrue;
  }

  auto &entry = f->getEntryBlock();
  for(int i = 0; i < 3; i++) {
  for(auto& bb : *f) {
    if(&bb == &entry) { continue; }

    auto current = ret[&bb];
    auto cond = new Or;
    for(auto it = pred_begin(&bb); it != pred_end(&bb); it++) {
      auto bc = BranchCondition(*it, &bb);
      assert(bc && "Branch condition must not be null!");

      cond = new Or{cond, new And{bc, ret[*it]}};
    }
    ret[&bb] = new And{current, cond};
  }
  }

  for(auto pair : ret) {
    ret[pair.first] = pair.second->Simplified();
  }
  return ret;
}

/** Simplifying Conditions **/

Condition *ConstTrue::Simplified() const {
  return new ConstTrue;
}

Condition *Branch::Simplified() const {
  return new Branch(*this);
}

/*
 * To simplify boolean AND, the steps are:
 *  - recursively simplify all subexpressions
 *  - flatten sub-ANDs
 *  - if all subexpressions are const true, then const true
 */
Condition *And::Simplified() const {
  if(operands.size() == 1) {
    return operands[0];
  }

  std::vector<Condition *> recs;

  // recursively simplify 
  for(auto op : operands) {
    recs.push_back(op->Simplified());
  }

  // flatten AND subexpressions
  std::vector<Condition *> flat;
  for(auto c : recs) {
    if(auto andc = dyn_cast<And>(c)) {
      flat.insert(flat.end(), andc->operands.begin(), andc->operands.end());
    } else {
      if(!isa<ConstTrue>(c)) {
        flat.push_back(c);
      }
    }
  }

  bool ctrue = std::all_of(recs.begin(), recs.end(),
    [=](Condition *c) {
      return isa<ConstTrue>(c);
    }
  );

  if(ctrue) {
    return new ConstTrue;
  }

  if(flat.size() == 1) {
    return flat[0];
  }
  return new And(flat.begin(), flat.end());
}

/*
 * To simplify a boolean OR, the steps are:
 *  - recursively simplify each subcondition
 *  - once that's done, if any subconditions are const true, then the simplified
 *    condition is itself const true.
 *  - otherwise, if any subconditions are an OR themselves, pull them up to the
 *    top level (flattening).
 */
Condition *Or::Simplified() const {
  if(operands.size() == 1) {
    return operands[0];
  }

  std::vector<Condition *> recs;

  // recursively simplify subconditions
  for(auto op : operands) {
    recs.push_back(op->Simplified());
  }

  // check for any constant-true subexpressions
  bool ctrue = std::any_of(recs.begin(), recs.end(),
    [=](Condition *c) {
      return isa<ConstTrue>(c);
    }
  );

  if(ctrue) {
    return new ConstTrue;
  }

  // flatten OR subexpressions
  std::vector<Condition *> flat;
  
  for(auto c : recs) {
    if(auto orc = dyn_cast<Or>(c)) {
      flat.insert(flat.end(), orc->operands.begin(), orc->operands.end());
    } else {
      flat.push_back(c);
    }
  }

  if(flat.size() == 1) {
    return flat[0];
  }
  return new Or(flat.begin(), flat.end());
}

/** Printing Conditions **/

const std::string ConstTrue::str() const {
  return "true";
}

const std::string Branch::str() const {
  std::string out;
  raw_string_ostream os(out);
  os << value << "=" << (constraint ? "true" : "false");
  return out;
}

const std::string And::str() const {
  std::string out;
  raw_string_ostream os(out);

  if(operands.empty()) {
    os << "true[&]";
  } else {
    os << "[";
    for(auto it = operands.begin(); it != operands.end() - 1; it++) {
      os << (*it)->str();
      os << " & ";
    }
    os << (*(operands.end() - 1))->str();
    os << "]";
  }

  return out; 
}

const std::string Or::str() const {
  std::string out;
  raw_string_ostream os(out);

  if(operands.empty()) {
    os << "false[|]";
  } else {
    os << "(";
    for(auto it = operands.begin(); it != operands.end() - 1; it++) {
      os << (*it)->str();
      os << " | ";
    }
    os << (*(operands.end() - 1))->str();
    os << ")";
  }

  return out; 
}
