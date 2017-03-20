add_subdirectory(lib)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/include")

add_llvm_executable(tesla-model
  model.cpp
)

target_link_libraries(tesla-model
  TeslaCommon
  TeslaModel
)

install(TARGETS tesla-model DESTINATION bin)
