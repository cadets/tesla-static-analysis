add_llvm_executable(tesla-extract
  extract.cpp
)

install(TARGETS tesla-extract DESTINATION bin)
