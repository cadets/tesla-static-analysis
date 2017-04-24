protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

add_llvm_executable(tesla-static
  static.cpp
  ManifestPass.cpp
  ManifestPassManager.cpp
  AcquireReleasePass.cpp
  CallSequencePass.cpp
  ModelCheckerPass.cpp
  AcquireReleaseCheck.cpp
  ControlPath.cpp
  Analysis.cpp
  OtherLockAnalysis.cpp
  NoBranchAnalysis.cpp
  ReleaseBeforeAcquireAnalysis.cpp
  CallOrderAnalysis.cpp
  MissingCallAnalysis.cpp
  ReleaseDominanceAnalysis.cpp
  AddressTakenAnalysis.cpp
  AcquireSequenceAnalysis.cpp
  ReachabilityGraph.cpp
  SimpleCallGraph.cpp
  CallsFunctionOnce.cpp
  Z3Pass.cpp
)

target_link_libraries(tesla-static
  TeslaCommon
  TeslaModel
  TeslaModelZ3
)

include_directories("${CMAKE_SOURCE_DIR}/tesla/model/include")
include_directories("${CMAKE_SOURCE_DIR}/tesla/trace/include")

install(TARGETS tesla-static DESTINATION bin)
