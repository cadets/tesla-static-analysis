#ifndef FINITE_STATE_MACHINE_H
#define FINITE_STATE_MACHINE_H

#include <cassert>
#include <map>
#include <queue>
#include <set>
#include <sstream>
#include <string>

/**
 * Declarations
 */

struct State {
  State() {}

  State(std::string s) :
    name(s) {}

  std::string name = "";
  bool accepting = false;
  bool initial = false;

  std::string Dot() const;

  static State Combined(std::set<std::shared_ptr<State>> states);
};

template<class T>
class Edge {
public:
  Edge(std::shared_ptr<State> end) :
    end_(end), edge_value_(nullptr) {}

  Edge(std::shared_ptr<State> end, T val) :
    end_(end), edge_value_(new T{val}) {}

  template<class E>
  bool Accepts(E val, std::function<bool (E,T)>) const;

  template<class E, class O>
  O Transduce(E val, std::function<O (E,T)> output) const;

  bool IsEpsilon() const { return !edge_value_; }

  const T& Value() const { return *edge_value_; }
  std::shared_ptr<State> End() const { return end_; }

  bool operator<(const Edge& other) const;

  std::string Dot() const;
private:
  std::shared_ptr<State> end_;
  std::shared_ptr<T> edge_value_;
};

template<class T>
class FiniteStateMachine {
public:
  FiniteStateMachine() {}

  FiniteStateMachine(const FiniteStateMachine<T>& other);
  FiniteStateMachine<T>& operator=(const FiniteStateMachine<T> other);

  std::shared_ptr<State> AddState(State s);
  Edge<T> AddEdge(std::shared_ptr<State> begin, std::shared_ptr<State> end);
  Edge<T> AddEdge(std::shared_ptr<State> begin, std::shared_ptr<State> end, T val);
  FiniteStateMachine<T>& AddSubMachine(FiniteStateMachine<T>& other);

  std::shared_ptr<State> InitialState() const;
  
  std::set<Edge<T>> Edges(std::shared_ptr<State> state) const;
  std::set<T> AllLabels() const;

  bool IsDeterministic() const;
  bool HasSingleAccept() const;

  std::set<std::shared_ptr<State>> EpsilonClosure(std::shared_ptr<State> state);
  std::set<std::shared_ptr<State>> AcceptingStates();

  FiniteStateMachine<T> EpsilonFree();
  FiniteStateMachine<T> Deterministic();
  FiniteStateMachine<T> Relabeled();

  template<class Iterator>
  bool AcceptsSequence(Iterator begin, Iterator end);

  template<class Iterator, class E>
  bool AcceptsSequence(Iterator begin, Iterator end, std::function<bool (E,T)> acc);

  template<class Iterator, class O>
  std::vector<O> TransduceSequence(Iterator begin, Iterator end,
                                   std::function<O (T)> output);

  template<class Iterator, class E, class O>
  std::vector<O> TransduceSequence(Iterator begin, Iterator end,
                                   std::function<bool (E,T)> acc, 
                                   std::function<O (E,T)> output);

  std::string Dot() const;
private:
  std::map<std::shared_ptr<State>, std::set<Edge<T>>> adjacency_; 
};

/**
 * FiniteStateMachine Implementation
 */

// "Law of the big two" rather than the rule of three applies here because the
// only resources the class manages are smart pointers. The reason we want to
// implement the copy constructor and copy assignment operator is that the
// shared_ptrs that an instance manages are *internal* only (to copy a machine,
// we want to copy the pointed-to states).
template<class T>
FiniteStateMachine<T>::FiniteStateMachine(const FiniteStateMachine<T>& other)
{
  auto cache = std::map<std::shared_ptr<State>, std::shared_ptr<State>>{};

  for(const auto& adj_list : other.adjacency_) {
    if(cache.find(adj_list.first) == cache.end()) {
      cache[adj_list.first] = AddState(*adj_list.first);
    }
  }

  for(const auto& adj_list : other.adjacency_) {
    for(const auto& edge : adj_list.second) {
      if(edge.IsEpsilon()) {
        AddEdge(cache[adj_list.first], cache[edge.End()]);
      } else {
        AddEdge(cache[adj_list.first], cache[edge.End()], edge.Value());
      }
    }
  }
}

template<class T>
FiniteStateMachine<T>& 
  FiniteStateMachine<T>::operator=(const FiniteStateMachine<T> other)
{
  std::swap(*this, other);
  return *this;
}

template<class T>
std::shared_ptr<State> FiniteStateMachine<T>::AddState(State s)
{
  auto pointer = std::shared_ptr<State>{new State{s}};
  adjacency_[pointer] = {};
  return pointer;
}

template<class T>
Edge<T> FiniteStateMachine<T>::AddEdge(std::shared_ptr<State> begin, 
                                       std::shared_ptr<State> end)
{
  auto edge = Edge<T>{end};
  adjacency_[begin].insert(edge);
  return edge;
}

template<class T>
Edge<T> FiniteStateMachine<T>::AddEdge(std::shared_ptr<State> begin, 
                                       std::shared_ptr<State> end, T val)
{
  auto edge = Edge<T>{end, val};
  adjacency_[begin].insert(edge);
  return edge;
}

template<class T>
FiniteStateMachine<T>& FiniteStateMachine<T>::AddSubMachine(FiniteStateMachine<T>& other)
{
  for(const auto& adj_list : other.adjacency_) {
    adjacency_[adj_list.first] = adj_list.second;
  }

  return other;
}

template<class T>
std::shared_ptr<State> FiniteStateMachine<T>::InitialState() const
{
  auto found = std::find_if(adjacency_.begin(), adjacency_.end(),
    [=](auto p) { 
      return p.first->initial; 
    }
  );

  assert(found != adjacency_.end());
  return found->first;
}

template<class T>
std::set<Edge<T>> FiniteStateMachine<T>::Edges(std::shared_ptr<State> state) const
{
  if(adjacency_.find(state) == adjacency_.end()) {
    return {};
  }

  return adjacency_.find(state)->second;
}

template<class T>
std::set<T> FiniteStateMachine<T>::AllLabels() const
{
  auto labels = std::set<T>{};
  for(const auto& pair : adjacency_) {
    for(const auto& edge : pair.second) {
      if(!edge.IsEpsilon()) { labels.insert(edge.Value()); }
    }
  }
  return labels;
}

template<class T>
bool FiniteStateMachine<T>::IsDeterministic() const
{
  return std::all_of(adjacency_.begin(), adjacency_.end(),
    [=](auto adj_list) {
      auto epsilon_free = std::all_of(adj_list.second.begin(), adj_list.second.end(),
        [=](auto edge) {
          return !edge.IsEpsilon();
        }
      );

      auto edges = std::set<T>{};
      auto unique = true;
      for(const auto& edge : adj_list.second) {
        if(!edge.Value()) {
          continue;
        }

        auto found = edges.find(edge.Value());
        if(found == edges.end()) {
          edges.insert(edge.Value());
        } else {
          unique = false;
          break;
        }
      }

      return epsilon_free && unique;
    }
  );
}

template<class T>
bool FiniteStateMachine<T>::HasSingleAccept() const
{
  return std::count_if(adjacency_.begin(), adjacency_.end(),
    [=](auto adj_list) {
      return adj_list.first->accepting;
    }
  ) == 1;
}

template<class T>
std::set<std::shared_ptr<State>>
  FiniteStateMachine<T>::EpsilonClosure(std::shared_ptr<State> state)
{
  auto ret = std::set<std::shared_ptr<State>>{ state };
  auto visited = decltype(ret){};

  auto work_queue = std::queue<std::shared_ptr<State>>{};
  work_queue.push(state);

  while(!work_queue.empty()) {
    auto next = work_queue.front();
    work_queue.pop();

    if(visited.find(next) != visited.end()) {
      continue;
    } else {
      visited.insert(next);
    }

    for(const auto& edge : adjacency_[next]) {
      if(edge.IsEpsilon()) {
        ret.insert(edge.End());
        work_queue.push(edge.End());
      }
    }
  }

  return ret;
}

template<class T>
std::set<std::shared_ptr<State>> FiniteStateMachine<T>::AcceptingStates()
{
  auto ret = std::set<std::shared_ptr<State>>{};

  for(const auto& adj_list : adjacency_) {
    if(adj_list.first->accepting) {
      ret.insert(adj_list.first);
    }
  }

  return ret;
}

template<class T>
FiniteStateMachine<T> FiniteStateMachine<T>::EpsilonFree()
{
  auto closure_map = std::map<std::shared_ptr<State>, std::shared_ptr<State>>{};
  auto eps_free = FiniteStateMachine<T>{};

  for(const auto& adj_list : adjacency_) {
    const auto& state = adj_list.first;
    auto combined = State::Combined(EpsilonClosure(state));
    combined.initial = state->initial;

    auto added = eps_free.AddState(combined);
    closure_map[state] = added;
  }

  for(const auto& adj_list : adjacency_) {
    const auto& state = adj_list.first;

    for(const auto& member : EpsilonClosure(state)) {
      for(const auto& edge : adjacency_[member]) {
        if(!edge.IsEpsilon()) {
          eps_free.AddEdge(closure_map[state], closure_map[edge.End()], edge.Value());
        }
      }
    }
  }

  return eps_free;
}

template<class T>
FiniteStateMachine<T> FiniteStateMachine<T>::Deterministic()
{
  auto eps_free = EpsilonFree();
  auto dfa = FiniteStateMachine<T>{};

  auto initial_state = eps_free.InitialState();
  auto work_queue = std::queue<std::set<std::shared_ptr<State>>>{};
  work_queue.push({initial_state});

  auto combined = std::map<std::set<std::shared_ptr<State>>, std::shared_ptr<State>>{};
  auto visited = std::set<std::set<std::shared_ptr<State>>>{};

  while(!work_queue.empty()) {
    auto next = work_queue.front();
    work_queue.pop();

    if(visited.find(next) == visited.end()) {
      visited.insert(next);
    } else {
      continue;
    }

    if(combined.find(next) == combined.end()) {
      auto cs = State::Combined(next);
      auto csa = dfa.AddState(cs);
      combined[next] = csa;
    }

    auto reachable = std::map<T, std::set<std::shared_ptr<State>>>{};
    for(const auto& state : next) {
      for(const auto& edge : eps_free.adjacency_[state]) {
        reachable[edge.Value()].insert(edge.End());
      }
    }

    for(const auto& reach_pair : reachable) {
      work_queue.push(reach_pair.second);

      if(combined.find(reach_pair.second) == combined.end()) {
        auto cs = State::Combined(reach_pair.second);
        auto csa = dfa.AddState(cs);
        combined[reach_pair.second] = csa;
      }

      dfa.AddEdge(combined[next], combined[reach_pair.second], reach_pair.first);
    }
  }

  return dfa;
}

template<class T>
FiniteStateMachine<T> FiniteStateMachine<T>::Relabeled()
{
  auto new_fsm = *this;
  int label = 0;

  for(const auto& adj_list : new_fsm.adjacency_) {
     adj_list.first->name = "s" + std::to_string(label++);
  }

  return new_fsm;
}

template<class T>
template<class Iterator>
bool FiniteStateMachine<T>::AcceptsSequence(Iterator begin, Iterator end)
{
  return AcceptsSequence<Iterator, T>(begin, end, 
    [=](auto t1, auto t2) {
      return t1 == t2;
    }
  );
}

template<class T>
template<class Iterator, class E>
bool FiniteStateMachine<T>::AcceptsSequence(Iterator begin, Iterator end, 
                                            std::function<bool (E,T)> acc)
{
  static_assert(std::is_same<typename std::iterator_traits<Iterator>::value_type, E>::value,
                "Wrong iterator type used for acceptance check");

  auto fsm = (IsDeterministic() ? *this : Deterministic());

  auto state = fsm.InitialState();
  for(auto it = begin; it != end; it++) {
    auto accepting_edge = std::find_if(fsm.adjacency_[state].begin(), fsm.adjacency_[state].end(),
      [=](Edge<T> edge) {
        return edge.Accepts(*it, acc);
      }
    );

    if(accepting_edge == fsm.adjacency_[state].end()) {
      return false;
    } else {
      state = accepting_edge->End();
    }
  }

  return state->accepting;
}

template<class T>
template<class Iterator, class O>
std::vector<O> FiniteStateMachine<T>::TransduceSequence(Iterator begin, Iterator end,
                                                        std::function<O (T)> output)
{
  return TransduceSequence<Iterator, T, O>(begin, end, 
    [](auto e, auto t) { return e == t; },
    [output](auto e, auto t) { return output(t); }
  );
}

template<class T>
template<class Iterator, class E, class O>
std::vector<O> FiniteStateMachine<T>::TransduceSequence(Iterator begin, Iterator end,
                                                        std::function<bool (E,T)> acc, 
                                                        std::function<O (E,T)> output)
{
  static_assert(std::is_same<typename std::iterator_traits<Iterator>::value_type, E>::value,
                "Wrong iterator type used in transducer");

  auto fsm = (IsDeterministic() ? *this : Deterministic());
  auto transduced_sequence = std::vector<O>{};

  auto state = fsm.InitialState();
  for(auto it = begin; it != end; it++) {
    auto accepting_edge = std::find_if(fsm.adjacency_[state].begin(), fsm.adjacency_[state].end(),
      [=](Edge<T> edge) {
        return edge.Accepts(*it, acc);
      }
    );

    if(accepting_edge == fsm.adjacency_[state].end()) {
      return {};
    } else {
      transduced_sequence.push_back(accepting_edge->Transduce(*it, output));
      state = accepting_edge->End();
    }
  }

  if(state->accepting) {
    return transduced_sequence;
  } else {
    return {};
  }
}

template<class T>
std::string FiniteStateMachine<T>::Dot() const
{
  std::stringstream out;

  out << "digraph {\n";
  out << "  node[shape=circle]\n";
  out << "  graph[charset=utf8]\n";
  for(const auto& adj_list : adjacency_) {
    out << "  " << adj_list.first->Dot() << '\n';
    for(const auto& edge : adj_list.second) {
      out << "  \"" << adj_list.first->name << "\" -> " << edge.Dot() << "\n";
    }
  }
  out << "}";

  return out.str();
}

/**
 * State Implementation
 */

inline std::string State::Dot() const
{
  std::stringstream out;

  out << "\"" << name << "\"";

  if(accepting) {
    out << " [shape=doublecircle]";
  }

  if(initial) {
    out << ";\"secret\" [style=invis,shape=point];\"secret\"->\"" << name << "\"";
  }

  return out.str();
}

inline State State::Combined(std::set<std::shared_ptr<State>> states) 
{
  auto state = State{};

  std::stringstream name;
  name << "{";

  auto i = 0;
  for(auto it = states.begin(); it != states.end(); i++, it++) {
    name << (*it)->name;
    if(i != states.size() - 1) {
      name << ", ";
    }
  }

  name << "}";
  state.name = name.str();

  state.accepting = std::any_of(states.begin(), states.end(),
    [=](auto st) {
      return st->accepting;
    }
  );

  state.initial = (states.size() == 1 && (*states.begin())->initial);

  return state;
}

/**
 * Edge Implementation
 */

template<class T>
template<class E>
bool Edge<T>::Accepts(E val, std::function<bool (E,T)> acceptor) const
{
  return edge_value_ && acceptor(val, *edge_value_);
}

template<class T>
std::string Edge<T>::Dot() const {
  std::stringstream out;

  out << "\"" << end_->name << "\"";
  out << " [label=\"  ";
  if(edge_value_) {
    out << *edge_value_;
  } else {
    out << "&#949;";
  }
  out << "\"]";

  return out.str();
}

template<class T>
template<class E, class O>
O Edge<T>::Transduce(E val, std::function<O (E,T)> output) const
{
  return output(val, *edge_value_);
}

template<class T>
bool Edge<T>::operator<(const Edge& other) const {
  return (end_ < other.end_) || 
         (end_ == other.end_ && edge_value_ < other.edge_value_);
}

#endif
