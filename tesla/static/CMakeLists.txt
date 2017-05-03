set(mutex_sources
  mutex/Analysis.cpp
  mutex/AcquireReleasePass.cpp
  mutex/AcquireReleaseCheck.cpp
  mutex/ControlPath.cpp
  mutex/OtherLockAnalysis.cpp
  mutex/NoBranchAnalysis.cpp
  mutex/ReleaseBeforeAcquireAnalysis.cpp
  mutex/CallOrderAnalysis.cpp
  mutex/MissingCallAnalysis.cpp
  mutex/ReleaseDominanceAnalysis.cpp
  mutex/AddressTakenAnalysis.cpp
  mutex/AcquireSequenceAnalysis.cpp
  mutex/ReachabilityGraph.cpp
  mutex/SimpleCallGraph.cpp
  mutex/CallsFunctionOnce.cpp
)

set(model_checker_sources
  model-checker/CheckResult.cpp
  model-checker/InlineAllPass.cpp
  model-checker/StubFunctionsPass.cpp
  model-checker/TraceFinder.cpp
  model-checker/ModelChecker.cpp
  model-checker/Z3Solver.cpp
  model-checker/Z3Pass.cpp
)

add_llvm_executable(tesla-static
  static.cpp
  ManifestPass.cpp
  ManifestPassManager.cpp
  ${model_checker_sources}
  ${mutex_sources}
)

target_link_libraries(tesla-static
  TeslaCommon
  z3
)

include_directories("${CMAKE_SOURCE_DIR}/tesla/trace/include")

install(TARGETS tesla-static DESTINATION bin)
