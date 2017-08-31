unset(LLVM_LINK_COMPONENTS)
add_llvm_loadable_module(LLVMTeslaStatic
  StaticPass.cpp
  ManifestPass.cpp
  CheckResult.cpp
  InlineAllPass.cpp
  StubFunctionsPass.cpp
  TraceFinder.cpp
  ModelChecker.cpp
  Z3Solver.cpp
  Z3Pass.cpp

  PLUGIN_TOOL
  opt
)

target_link_libraries(LLVMTeslaStatic
  TeslaCommon
  z3
)

install(TARGETS LLVMTeslaStatic DESTINATION lib)
