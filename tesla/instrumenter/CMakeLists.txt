# Dependency tracking: protobuf_generate_cpp() only sort-of works across dirs.
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

#set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
#	asmparser
#	bitreader
#	bitwriter
#)

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

# add_llvm_executable(tesla-instrument
# 	instrument.cpp
# )
# 
target_link_libraries(LLVMTeslaInstrument
  TeslaCommon
)
# 
# include_directories("${CMAKE_SOURCE_DIR}/../include")
# 
install(TARGETS LLVMTeslaInstrument DESTINATION lib)
