#include <numeric>

#include <llvm/IR/Instructions.h>
#include <llvm/Support/CFG.h>

#include "CartesianProduct.h"
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
  for(int i = 0; i < 2; i++) {
  for(auto& bb : *f) {
    if(&bb == &entry) { continue; }

    auto current = ret[&bb];
    auto cond = new Or;
    for(auto it = pred_begin(&bb); it != pred_end(&bb); it++) {
      auto bc = BranchCondition(*it, &bb);
      assert(bc && "Branch condition must not be null!");

      cond = new Or{cond, new And{bc, ret[*it]}};
    }

    auto aop = new And{current, cond};
    ret[&bb] = aop->CNF()->Simplified();
  }
  }

  return ret;
}

/** Conversion to CNF & Flattening **/

And *And::FlattenAnd() {
  std::vector<Condition *> newOps;

  for(auto op : operands) {
    if(auto ao = dyn_cast<And>(op)) {
      auto flat = ao->FlattenAnd();
      for(auto fo : flat->operands) {
        newOps.push_back(fo->Flattened());
      }
    } else {
      newOps.push_back(op);
    }
  }

  return new And(newOps.begin(), newOps.end());
}

Or *Or::FlattenOr() {
  std::vector<Condition *> newOps;

  for(auto op : operands) {
    if(auto ao = dyn_cast<Or>(op)) {
      auto flat = ao->FlattenOr();
      for(auto fo : flat->operands) {
        newOps.push_back(fo->Flattened());
      }
    } else {
      newOps.push_back(op);
    }
  }

  return new Or(newOps.begin(), newOps.end());
}

Condition *And::CNF() {
  auto flat = FlattenAnd();
  std::vector<Condition *> inCNF;

  for(auto op : flat->operands) {
    inCNF.push_back(op->CNF()->Flattened());
  }

  return new And{inCNF.begin(), inCNF.end()};
}

Condition *Or::CNF() {
  auto flat = FlattenOr();

  // it is possible that an OR condition is already a clause, in which case it
  // is already in CNF (i.e. it can be included in an AND at the top level)
  bool isClause = std::none_of(flat->operands.begin(), flat->operands.end(),
    [=](Condition *c) {
      return isa<And>(c);
    }
  );

  if(isClause) {
    return flat;
  }

  // otherwise, there is an AND nested inside the OR expression. If this is the
  // case, then we need to partition the AND and root subexpressions of the
  // flattened AND
  
  std::vector<And *> ands;
  std::vector<Condition *> roots;

  std::for_each(flat->operands.begin(), flat->operands.end(),
    [&](Condition *c) {
      assert(!isa<Or>(c) && "Flattening OR is broken");
      if(auto a = dyn_cast<And>(c)) {
        ands.push_back(a->FlattenAnd());
      } else {
        roots.push_back(c);
      }
    }
  );

  // now that we have separated the ANDs and roots, we need to generate a
  // cartesian product over the operands of all the AND subexpressions
  // identified. This product is itself an AND over a set of ORs, with each OR
  // having one member from each AND. The total number of these is the product
  // of the number of operands in each AND.
  // As well as this, we need to OR each member of the cartesian product with
  // the root expressions found.

  auto rootor = new Or{roots.begin(), roots.end()};
  auto prod = And::Product(ands);
  auto dist = new Or{rootor, prod};
  
  return dist->Flattened();
}

// turn a vector of ANDs [a&b, c&d&e] (that are implicitly ORed together) into
// the inside-out version [a|c, a|d, ..., b|e]
And *And::Product(std::vector<And *> ands) {
  vector<vector<Condition *>> conds;

  for(auto a : ands) {
    conds.push_back(a->operands);
  }

  auto cart = tesla::CartesianProduct(conds);

  vector<Or *> ors;
  for(auto t : cart) {
    ors.push_back(new Or{t.begin(), t.end()});
  }

  return new And{ors.begin(), ors.end()};
}

Condition *And::Simplified() {
  auto flat = FlattenAnd();

  std::vector<Condition *> simples;
  for(auto c : flat->operands) {
    auto simp = c->Simplified();
    if(!isa<ConstTrue>(simp)) {
      simples.push_back(simp);
    }
  }

  if(simples.empty()) {
    return new ConstTrue;
  }

  return new And{simples.begin(), simples.end()};
}

Condition *Or::Simplified() {
  auto flat = FlattenOr();

  std::vector<Condition *> simples;
  for(auto c : flat->operands) {
    simples.push_back(c->Simplified());
  }

  bool anyTrue = std::any_of(simples.begin(), simples.end(),
    [=](Condition *c) {
      return isa<ConstTrue>(c);
    }
  );
  
  if(anyTrue) {
    return new ConstTrue;
  }

  for(auto s : simples) {
    auto dup = std::any_of(simples.begin(), simples.end(),
      [=](Condition *c) {
        if(auto sb = dyn_cast<Branch>(s)) {
          if(auto cb = dyn_cast<Branch>(c)) {
            return (cb->value == sb->value) && (cb->constraint ^ sb->constraint);
          }
        }
        return false;
      }
    );

    if(dup) {
      return new ConstTrue;
    }
  }

  return new Or{simples.begin(), simples.end()};
}

/** Printing Conditions **/

std::string ConstTrue::str() const {
  return "true";
}

std::string Branch::str() const {
  std::string out;
  raw_string_ostream os(out);
  os << value << "=" << (constraint ? "true" : "false");
  return out;
}

std::string And::str() const {
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

std::string Or::str() const {
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
