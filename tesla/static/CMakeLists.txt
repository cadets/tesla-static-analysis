protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

set(mutex_analyses
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

add_llvm_executable(tesla-static
  static.cpp
  ManifestPass.cpp
  ManifestPassManager.cpp
  Z3Pass.cpp
  ${mutex_analyses}
)

target_link_libraries(tesla-static
  TeslaCommon
  z3
  TeslaModelZ3
)

include_directories("${CMAKE_SOURCE_DIR}/tesla/trace/include")

install(TARGETS tesla-static DESTINATION bin)
