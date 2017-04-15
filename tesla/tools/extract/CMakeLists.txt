add_llvm_executable(tesla-extract
  extract.cpp
)

target_link_libraries(tesla-extract
  TeslaCommon
)

install(TARGETS tesla-extract DESTINATION bin)
