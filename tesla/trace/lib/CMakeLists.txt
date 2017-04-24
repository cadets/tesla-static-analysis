protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

add_llvm_library(TeslaModelZ3
  trace_finder.cpp
  smt_text_gen.cpp
  stub_functions_pass.cpp
  inline_all_pass.cpp
  z3_solve.cpp
)

target_link_libraries(TeslaModelZ3
  TeslaCommon
)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../include")
