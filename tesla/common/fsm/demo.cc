#include <iostream>

#include "finite_state_machine.h"

int main() {
  auto q1 = State{"X"};
  q1.initial = true;

  auto q2 = State{"0"};
  auto q3 = State{"1"};
  auto q4 = State{"2"};
  auto q5 = State{"3"};
  q5.accepting = true;

  auto f = FiniteStateMachine<int>{};
  auto q1a = f.AddState(q1);
  auto q2a = f.AddState(q2);
  auto q3a = f.AddState(q3);
  auto q4a = f.AddState(q4);
  auto q5a = f.AddState(q5);

  f.AddEdge(q1a, q1a, 0);
  f.AddEdge(q1a, q1a, 1);
  f.AddEdge(q1a, q2a, 1);

  f.AddEdge(q2a, q3a, 0);
  f.AddEdge(q2a, q3a, 1);

  f.AddEdge(q3a, q4a, 0);
  f.AddEdge(q3a, q4a, 1);

  f.AddEdge(q4a, q5a, 0);
  f.AddEdge(q4a, q5a, 1);
  
  std::cout << f.Dot() << '\n';
  std::cout << f.Deterministic().Dot() << '\n';
  std::cout << f.Deterministic().Relabeled().Dot() << '\n';
  std::cout << "Single Accept (NFA): " << f.HasSingleAccept() << '\n';
  std::cout << "Single Accept (DFA): " << f.Deterministic().HasSingleAccept() << '\n';

  auto vs = std::vector<int>{0, 0, 1, 0, 1, 0};
  std::cout << "Accepts: " 
    << f.AcceptsSequence(vs.begin(), vs.end()) << '\n';

  auto ts = f.TransduceSequence<decltype(vs)::iterator, std::string>(vs.begin(), vs.end(),
      [](auto t) { return std::to_string(t*21) + "^"; }
  );
  for(const auto& t : ts) {
    std::cout << t << '\n';
  }

  return 0;
}
