cmake_minimum_required(VERSION 3.6.2)

project(Locks)

set(MAIN_EXE_NAME locks)
set(MAIN_C_SOURCES 
  main.c
  lock.c
)

add_tesla_executable("${MAIN_C_SOURCES}" "${MAIN_EXE_NAME}")

set(BASIC_SRC 
  basic.c 
  lock.c
)
add_tesla_executable("${BASIC_SRC}" "basic")
