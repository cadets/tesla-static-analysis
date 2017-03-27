#include <numeric>
#include <queue>

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
  auto &entry = f->getEntryBlock();

  // Initialise the mapping between blocks and conditions - we know we can
  // always get to the entry block, so there's no inference to be made there. We
  // don't know anything about any other blocks, so we give them the strongest
  // possible inference and weaken based on later information.
  for(auto& bb : *f) {
    if(&bb == &entry) {
      ret[&bb] = new ConstTrue;
    } else {
      ret[&bb] = new Or;
    }
  }

  std::queue<BasicBlock *> workQueue;
  workQueue.push(&entry);

  int i = 0;
  while(i < 10 && !workQueue.empty()) {
    auto next = workQueue.front();
    workQueue.pop();

    auto term = next->getTerminator();
    for(auto i = 0; i < term->getNumSuccessors(); i++) {
      auto succ = term->getSuccessor(i);

      auto transition = new And{ret[next], BranchCondition(next, succ)};
      auto newInf = new Or{ret[succ], transition};

      ret[succ] = newInf;

      if(true) { // actually, if changes were made to succ's inference
        workQueue.push(succ);
      }
    }

    i++;
  }

  return ret;
}

std::set<Branch> LogicalOp::Branches() const {
  std::set<Branch> ret;

  for(auto op : operands) {
    for(auto br : op->Branches()) {
      ret.insert(br);
    }
  }

  return ret;
}

/** Evaluating Conditions **/

bool Branch::Eval() const {
  assert(false && "Can't evaluate a branch - expression not constant!");
}

bool And::Eval() const {
  return std::all_of(operands.begin(), operands.end(),
    [](Condition *op) {
      return op->Eval();
    }
  );
}

bool Or::Eval() const {
  return std::all_of(operands.begin(), operands.end(),
    [](Condition *op) {
      return op->Eval();
    }
  );
}

/** Equality of Conditions **/

bool ConstFalse::Equal(Condition *other) const {
  return isa<ConstFalse>(other);
}

bool ConstTrue::Equal(Condition *other) const {
  return isa<ConstTrue>(other);
}

bool Branch::Equal(Condition *other) const {
  if(auto ob = dyn_cast<Branch>(other)) {
    return (value == ob->value) && (constraint == ob->constraint);
  }

  return false;
}

bool And::Equal(Condition *other) const {
  if(!isa<And>(other)) {
    return false;
  }
  auto a_other = cast<And>(other);

  if(operands.size() != a_other->operands.size()) {
    return false;
  }

  bool allEq = true;
  for(auto i = 0; i < operands.size(); i++) {
    allEq = allEq && operands[i]->Equal(a_other->operands[i]);
  }

  return allEq;
}

bool Or::Equal(Condition *other) const {
  if(!isa<Or>(other)) {
    return false;
  }
  auto o_other = cast<Or>(other);

  if(operands.size() != o_other->operands.size()) {
    return false;
  }

  bool allEq = true;
  for(auto i = 0; i < operands.size(); i++) {
    allEq = allEq && operands[i]->Equal(o_other->operands[i]);
  }

  return allEq;
}

bool Branch::Opposite(Branch *other) const {
  return (value == other->value) && (constraint ^ other->constraint);
}

/** Printing Conditions **/

std::string ConstFalse::str() const {
  return "false";
}

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
    // print in reverse order to make the accidental sequencing clearer.
    for(auto it = operands.begin(); it != operands.end() - 1; it++) {
      os << (*it)->str();
      os << " | ";
    }
    os << (*(operands.end() - 1))->str();
    os << ")";
  }

  return out; 
}
