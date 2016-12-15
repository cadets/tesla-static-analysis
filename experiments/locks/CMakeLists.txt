cmake_minimum_required(VERSION 3.6.2)

project(Locks)
set(EXE_NAME locks)

find_package(Threads)

set(C_SOURCES 
  main.c
  lock.c
)
set(TESLA_LINK "-L/home/test/tesla_install/lib" "-ltesla")

set(TESLA_INCLUDE "-I/home/test/tesla_install/include")

set(CMAKE_C_FLAGS "-g ${CMAKE_C_FLAGS}")
string(REPLACE " " ";" CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
set(TESLA_FILES)
set(LL_FILES)
set(INSTR_FILES)
foreach(source ${C_SOURCES})
  get_filename_component(name ${source} NAME_WE)
  set(full_source "${CMAKE_CURRENT_SOURCE_DIR}/${source}")

  add_custom_command(
    OUTPUT ${name}.tesla
    COMMAND tesla analyse ${full_source} -o ${name}.tesla -- ${CMAKE_C_FLAGS} ${TESLA_INCLUDE}
    DEPENDS ${full_source}
  )
  add_custom_target(${name}_tesla
    ALL DEPENDS ${name}.tesla
  )
  list(APPEND TESLA_FILES ${name}.tesla)

  add_custom_command(
    OUTPUT ${name}.ll
    COMMAND ${CMAKE_C_COMPILER}
    ARGS ${CMAKE_C_FLAGS} -S -emit-llvm ${TESLA_INCLUDE} ${full_source} -o ${name}.ll
    DEPENDS ${full_source}
  )
  add_custom_target(${name}_ll
    ALL DEPENDS ${name}.ll
  )
  list(APPEND LL_FILES ${name}.ll)

  add_custom_command(
    OUTPUT ${name}.instr.ll
    COMMAND tesla instrument -tesla-manifest tesla.manifest ${name}.ll -o ${name}.instr.ll
    DEPENDS ${name}.ll tesla.manifest
  )
  add_custom_target(${name}_instr
    ALL DEPENDS ${name}.instr.ll
  )
list(APPEND INSTR_FILES ${name}.instr.ll)
endforeach()

add_custom_command(
  OUTPUT tesla.manifest
  COMMAND tesla cat ${TESLA_FILES} -o tesla.manifest
  DEPENDS ${TESLA_FILES}
)
add_custom_target(manifest
  ALL DEPENDS tesla.manifest
)

add_custom_command(
  OUTPUT ${EXE_NAME}
  COMMAND clang33 ${CMAKE_C_FLAGS} ${CMAKE_THREAD_LIBS_INIT} ${TESLA_LINK} ${INSTR_FILES} -o ${EXE_NAME}
  DEPENDS ${INSTR_FILES}
)
add_custom_target(tesla-all
  ALL DEPENDS ${EXE_NAME}
)
