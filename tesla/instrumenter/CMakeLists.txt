# Dependency tracking: protobuf_generate_cpp() only sort-of works across dirs.
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

unset(LLVM_LINK_COMPONENTS)
add_llvm_loadable_module(LLVMTeslaInstrument
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

  PLUGIN_TOOL
  opt
)

target_link_libraries(LLVMTeslaInstrument
  TeslaCommon
)

include_directories("${CMAKE_SOURCE_DIR}/../include")
 
install(TARGETS LLVMTeslaInstrument DESTINATION lib)
