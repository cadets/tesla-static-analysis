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
  while(i < 7 && !workQueue.empty()) {
    auto next = workQueue.front();
    workQueue.pop();

    auto term = next->getTerminator();
    for(auto i = 0; i < term->getNumSuccessors(); i++) {
      auto succ = term->getSuccessor(i);

      auto transition = new And{ret[next], BranchCondition(next, succ)};
      auto newInf = new Or{ret[succ], transition};
      
      ret[succ] = newInf->Decomposed()->Simplified();

      if(true) { // actually, if changes were made to succ's inference
        workQueue.push(succ);
      }
    }

    i++;
  }

  return ret;
}

/** Shannon Decomposition **/

Condition *Condition::SplitOn(Branch b) const {
  // should check for const-ness here and then eval - not possible with the
  // current API without nasty try-catch. Should reimplement IsConst recursively
  // without constructing a set
  auto trueVal = Restricted(b, new ConstTrue);
  if(trueVal->IsConstant()) {
    trueVal = (trueVal->Eval() ? (Condition *)new ConstTrue : (Condition *)new ConstFalse);
  }

  auto falseVal = Restricted(b, new ConstFalse);
  if(falseVal->IsConstant()) {
    falseVal = (falseVal->Eval() ? (Condition *)new ConstTrue : (Condition *)new ConstFalse);
  }

  return new Or{
    new And{new Branch(b), trueVal},
    new And{b.Negated(), falseVal}
  };
}

Condition *Condition::Decomposed() {
  auto currentExpr = this;
  for(auto b : Branches()) {
    currentExpr = currentExpr->SplitOn(b);
  }
  return currentExpr;
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
  return std::any_of(operands.begin(), operands.end(),
    [](Condition *op) {
      return op->Eval();
    }
  );
}

/** Simplification **/

Condition *ConstTrue::Simplified() const {
  return new ConstTrue;
}

Condition *ConstFalse::Simplified() const {
  return new ConstFalse;
}

Condition *Branch::Simplified() const {
  return new Branch{*this};
}

template<class C, class Zero, class Elim, class Match>
Condition *LogicalOp::SimplifyLogic() const {
  if(IsConstant()) {
    if(Eval()) {
      return new ConstTrue;
    } else {
      return new ConstFalse;
    }
  }

  std::vector<Condition *> simples;
  for(auto op : operands) {
    auto sop = op->Simplified();
    if(!isa<Zero>(sop)) {
      simples.push_back(sop);
    }
  }

  auto elim = std::any_of(simples.begin(), simples.end(),
    [](Condition *c) { return isa<Elim>(c); }
  );

  if(elim) {
    return new Elim;
  }

  std::vector<Condition *> dedup;
  for(auto op : simples) {
    auto prev = std::find_if(dedup.begin(), dedup.end(),
      [=](Condition *c) {
        return c->Equal(op);
      }
    );

    if(prev == dedup.end()) {
      dedup.push_back(op);
    }
  }

  for(auto op : dedup) {
    if(auto br = dyn_cast<Branch>(op)) {
      auto dual = std::find_if(dedup.begin(), dedup.end(),
        [=](Condition *c) {
          auto ob = dyn_cast<Branch>(c);
          return ob && br->Opposite(ob);
        }
      );

      if(dual != dedup.end()) {
        return new Match;
      }
    }
  }

  if(dedup.size() == 0) {
    return new Zero;
  } else if(dedup.size() == 1) {
    return dedup[0];
  } else {
    return new C{dedup.begin(), dedup.end()};
  }
}

Condition *And::Simplified() const {
  return SimplifyLogic<And, ConstTrue, ConstFalse, ConstFalse>();
}

Condition *Or::Simplified() const {
  return SimplifyLogic<Or, ConstFalse, ConstTrue, ConstTrue>();
}

/** Restricting Conditions **/

Condition *ConstFalse::Restricted(Branch b, Condition *replace) const {
  return new ConstFalse(*this);
}

Condition *ConstTrue::Restricted(Branch b, Condition *replace) const {
  return new ConstTrue(*this);
}

Condition *Branch::Restricted(Branch b, Condition *replace) const {
  if(b == *this) {
    return replace;
  }

  return new Branch(*this);
}

Condition *And::Restricted(Branch b, Condition *replace) const {
  std::vector<Condition *> newOps;
  
  for(auto op : operands) {
    newOps.push_back(op->Restricted(b, replace));
  }

  return new And{newOps.begin(), newOps.end()};
}

Condition *Or::Restricted(Branch b, Condition *replace) const {
  std::vector<Condition *> newOps;
  
  for(auto op : operands) {
    newOps.push_back(op->Restricted(b, replace));
  }

  return new Or{newOps.begin(), newOps.end()};
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
    return *this == *ob;
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
