# Dependency tracking: protobuf_generate_cpp() only sort-of works across dirs.
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS tesla.proto)

# Add Clang include directories.
include_directories(
	"${LLVM_SRC}/tools/clang/include"
	"${LLVM_OBJ}/tools/clang/include")


#
# The TESLA analyser executable:
#
add_llvm_executable(tesla-analyse
	AST.cpp
	Parser.cpp
	Tool.cpp
	Visitor.cpp
)

# TeslaCommon no longer gets linked against the full set of LLVM libraries, so
# the analyser needs to be linked against them before it is linked against the
# TESLA library.
install(TARGETS tesla-analyse DESTINATION bin)


#
# Link against Clang and LLVM libraries:
#

# Clang doesn't provide an equivalent to llvm_map_components_to_libraries().
foreach(i
    Tooling Frontend Driver Serialization Parse Sema Analysis 
    Sema Serialization Tooling ASTMatchers AST Edit Lex Basic 
)
  target_link_libraries(tesla-analyse clang${i})
endforeach(i)

target_link_libraries(tesla-analyse ${LLVM_LIBS})
target_link_libraries(tesla-analyse TeslaCommon)

# Simply using add_llvm_executable() by itself isn't enough: that doesn't
# link the executable against some important libraries like LLVMSupport.
#
# Instead, we need to pass in ${LLVM_LIBS} explicitly.

