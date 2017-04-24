option(USE_Z3_SOLVER "Use the experimental Z3 solver" OFF)

if(USE_Z3_SOLVER)
set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD})

add_llvm_executable(tesla-trace 
  trace.cpp
  trace_finder.cpp
  smt_text_gen.cpp
  stub_functions_pass.cpp
  inline_all_pass.cpp
  z3_solve.cpp
)
target_link_libraries(tesla-trace 
  TeslaCommon
  z3 
  ${LLVM_LIBS}
)

install(TARGETS tesla-trace DESTINATION bin)
endif()
