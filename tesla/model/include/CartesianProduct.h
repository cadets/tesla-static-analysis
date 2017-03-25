#ifndef CARTESIAN_PRODUCT_H
#define CARTESIAN_PRODUCT_H

#include <numeric>
#include <vector>

#include <llvm/Support/raw_ostream.h>

using std::pair;
using std::vector;
using namespace llvm;

namespace tesla {

template<class T>
void VecDump(vector<vector<T>> in) {
  for(auto v : in) {
    errs() << "(";
    for(auto it = v.begin(); it != v.end() - 1; it++) {
      errs() << *it << ", ";
    }
    errs() << (*(v.end() - 1)) << ")\n";
  }
}

template<class T>
vector<vector<T>> CartesianProduct(vector<vector<T>> in) {
  auto total = std::accumulate(in.begin(), in.end(), 1,
    [=](int p, vector<T> a) {
      return p * a.size();
    }
  );

  vector<pair<vector<T>, int>> pairs;
  for(auto v : in) {
    pairs.push_back({v, 0});
  }

  vector<vector<T>> out;
  for(auto i = 0; i < total; i++) {
    vector<T> entry;

    for(auto p : pairs) {
      entry.push_back(p.first[p.second]);
    }

    out.push_back(entry);

    auto reset = pairs.end() - 1;
    reset->second++;

    while(reset->second == reset->first.size()) {
      reset->second = 0;
      reset--;
      reset->second++;
    }
  }

  return out;
}

}

#endif
