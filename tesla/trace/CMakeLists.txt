set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD})

add_llvm_executable(tesla-trace 
  trace.cpp
  trace_finder.cpp
  smt_gen.cpp
)
target_link_libraries(tesla-trace ${LLVM_LIBS})

install(TARGETS tesla-trace DESTINATION bin)
