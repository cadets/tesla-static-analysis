protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

add_library(TeslaProto ${PROTO_SRCS} ${PROTO_HDRS})
target_link_libraries(TeslaProto ${PROTOBUF_LIBRARY})

add_library(TeslaCommon
  Arguments.cpp
  Automaton.cpp
  Debug.cpp
  FSMBuilder.cpp
  Manifest.cpp
  Names.cpp
  Protocol.cpp
  State.cpp
  SuperFastHash.c
  Transition.cpp
)

target_link_libraries(TeslaCommon TeslaProto)
