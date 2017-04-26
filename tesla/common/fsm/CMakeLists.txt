cmake_minimum_required(VERSION 2.8.10)

set(CMAKE_CXX_COMPILER clang)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

add_executable(fsm-demo
  demo.cc
)

target_link_libraries(fsm-demo c++)
