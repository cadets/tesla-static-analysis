protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

add_llvm_library(TeslaModel
  EventGraph.cpp
  GraphTransforms.cpp
  ModelChecker.cpp
  FiniteTraces.cpp
  SequenceExpressions.cpp
  ModelGenerator.cpp
)

target_link_libraries(TeslaModel
  TeslaCommon
)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../include")
