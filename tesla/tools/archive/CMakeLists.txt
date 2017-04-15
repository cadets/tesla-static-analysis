add_llvm_executable(tesla-archive
  archive.cpp
)

target_link_libraries(tesla-archive
  TeslaCommon
)

install(TARGETS tesla-archive DESTINATION bin)
