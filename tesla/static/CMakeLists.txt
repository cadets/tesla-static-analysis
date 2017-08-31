unset(LLVM_LINK_COMPONENTS)
add_llvm_loadable_module(LLVMTeslaStatic
  StaticPass.cpp
  ManifestPass.cpp
  model-checker/CheckResult.cpp
  model-checker/InlineAllPass.cpp
  model-checker/StubFunctionsPass.cpp
  model-checker/TraceFinder.cpp
  model-checker/ModelChecker.cpp
  model-checker/Z3Solver.cpp
  model-checker/Z3Pass.cpp

  PLUGIN_TOOL
  opt
)

target_link_libraries(LLVMTeslaStatic
  TeslaCommon
  z3
)

install(TARGETS LLVMTeslaStatic DESTINATION lib)
