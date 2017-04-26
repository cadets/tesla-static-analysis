option(USE_Z3_SOLVER "Use the experimental Z3 solver" OFF)

if(USE_Z3_SOLVER)
set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD})

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/include")

add_llvm_executable(tesla-trace 
  trace.cpp
)
target_link_libraries(tesla-trace 
  TeslaCommon
  TeslaModelZ3
  z3 
  ${LLVM_LIBS}
)

install(TARGETS tesla-trace DESTINATION bin)

add_subdirectory(lib)
endif()
