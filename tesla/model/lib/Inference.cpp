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

  return ret;
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
