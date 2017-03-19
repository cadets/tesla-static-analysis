add_subdirectory(lib)

set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

add_llvm_executable(tesla-model
  model.cpp
)

target_link_libraries(tesla-model
  TeslaCommon
  TeslaModel
)

include_directories("${CMAKE_SOURCE_DIR}/../include")
include_directories(lib)

install(TARGETS tesla-model DESTINATION bin)
