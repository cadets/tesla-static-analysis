protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

add_llvm_executable(tesla-model
  model.cpp
  EventGraph.cpp
  GraphTransforms.cpp
  ModelChecker.cpp
)

target_link_libraries(tesla-model
  TeslaCommon
)

include_directories("${CMAKE_SOURCE_DIR}/../include")

install(TARGETS tesla-model DESTINATION bin)
