# Dependency tracking: protobuf_generate_cpp() only sort-of works across dirs.
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

unset(LLVM_LINK_COMPONENTS)
add_llvm_loadable_module(LLVMTesla
  InstrumentPass.cpp
  Annotations.cpp
  Assertion.cpp
  Callee.cpp
  Caller.cpp
  EventTranslator.cpp
  FieldReference.cpp
  InstrContext.cpp
  Instrumentation.cpp
  Remove.cpp
  TranslationFn.cpp

  StaticPass.cpp
  ManifestPass.cpp
  CheckResult.cpp
  InlineAllPass.cpp
  StubFunctionsPass.cpp
  TraceFinder.cpp
  ModelChecker.cpp
  Z3Solver.cpp
  Z3Pass.cpp

  PLUGIN_TOOL
  opt
)

target_link_libraries(LLVMTesla
  TeslaCommon
  z3
)

include_directories("${CMAKE_SOURCE_DIR}/../include")
 
install(TARGETS LLVMTesla DESTINATION lib)
