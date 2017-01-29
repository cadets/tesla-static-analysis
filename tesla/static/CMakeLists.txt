protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

add_llvm_executable(tesla-static
  static.cpp
  ManifestPass.cpp
  ManifestPassManager.cpp
  AcquireReleasePass.cpp
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
  ReachabilityGraph.cpp
  SimpleCallGraph.cpp
)

target_link_libraries(tesla-static
  TeslaCommon
)

include_directories("${CMAKE_SOURCE_DIR}/../include")

install(TARGETS tesla-static DESTINATION bin)
