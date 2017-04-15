set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD}
)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/include")

add_llvm_executable(tesla-archive
  archive.cpp
)

target_link_libraries(tesla-archive
  TeslaCommon
)

install(TARGETS tesla-archive DESTINATION bin)
