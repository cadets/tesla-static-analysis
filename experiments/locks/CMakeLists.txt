cmake_minimum_required(VERSION 3.6.2)

set(MAIN_EXE_NAME locks)
set(MAIN_C_SOURCES 
  main.c
  lock.c
)

add_tesla_executable("${MAIN_C_SOURCES}" "${MAIN_EXE_NAME}" TRUE)
install(
  PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/locks 
  DESTINATION bin
)

function(example name)
  set(SRC
    "${name}.c"
    lock.c
    mock.c
  )
  add_tesla_executable("${SRC}" ${name} TRUE)
endfunction()

example(basic)
example(no_acq)
example(mult_acq)
example(no_rel)
example(mult_rel)
example(no_acq_rel)
example(other)
