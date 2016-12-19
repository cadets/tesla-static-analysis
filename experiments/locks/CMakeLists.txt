cmake_minimum_required(VERSION 3.6.2)

project(Locks)

set(MAIN_EXE_NAME locks)
set(MAIN_C_SOURCES 
  main.c
  lock.c
)

add_tesla_executable("${MAIN_C_SOURCES}" "${MAIN_EXE_NAME}")

function(example name)
  set(SRC
    "${name}.c"
    lock.c
    mock.c
  )
  add_tesla_executable("${SRC}" ${name})
endfunction()

example(basic)
example(no_acq)
example(mult_acq)
example(no_rel)
example(mult_rel)
example(no_acq_rel)
example(other)
