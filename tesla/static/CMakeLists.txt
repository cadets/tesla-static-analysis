protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

add_llvm_executable(tesla-static
  static.cpp
)

target_link_libraries(tesla-static
  TeslaCommon
)

include_directories("${CMAKE_SOURCE_DIR}/../include")

install(TARGETS tesla-static DESTINATION bin)
