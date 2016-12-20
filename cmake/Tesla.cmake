find_package(Threads)

function(add_tesla_executable C_SOURCES EXE_NAME)
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
    set(prefix ${EXE_NAME}_${name})

    add_custom_command(
      OUTPUT ${prefix}.tesla
      COMMAND tesla analyse ${full_source} -o ${prefix}.tesla -- ${CMAKE_C_FLAGS} ${TESLA_INCLUDE}
      DEPENDS ${full_source}
    )
    add_custom_target(${prefix}_tesla
      ALL DEPENDS ${prefix}.tesla
    )
    list(APPEND TESLA_FILES ${prefix}.tesla)

    add_custom_command(
      OUTPUT ${prefix}.bc
      COMMAND ${CMAKE_C_COMPILER}
      ARGS ${CMAKE_C_FLAGS} -S -emit-llvm ${TESLA_INCLUDE} ${full_source} -o ${prefix}.bc
      DEPENDS ${full_source}
    )
    add_custom_target(${prefix}_ll
      ALL DEPENDS ${prefix}.bc
    )
    list(APPEND LL_FILES ${prefix}.bc)
  endforeach()

  add_custom_command(
    OUTPUT ${EXE_NAME}.bc
    COMMAND llvm-link33 ${LL_FILES} -o ${EXE_NAME}.bc
    DEPENDS ${LL_FILES}
  )
  add_custom_target(${EXE_NAME}_lto
    ALL DEPENDS ${EXE_NAME}.bc
  )

  add_custom_command(
    OUTPUT ${EXE_NAME}.instr.bc
    COMMAND tesla instrument -tesla-manifest ${EXE_NAME}_tesla.manifest ${EXE_NAME}.bc -o ${EXE_NAME}.instr.bc
    DEPENDS ${EXE_NAME}.bc ${EXE_NAME}_tesla.manifest
  )
  add_custom_target(${EXE_NAME}_instr
    ALL DEPENDS ${EXE_NAME}.instr.bc
  )

  add_custom_command(
    OUTPUT ${EXE_NAME}_tesla.manifest
    COMMAND tesla cat ${TESLA_FILES} -o ${EXE_NAME}_tesla.manifest
    DEPENDS ${TESLA_FILES}
  )
  add_custom_target(${EXE_NAME}-manifest
    ALL DEPENDS ${EXE_NAME}_tesla.manifest
  )

  set(INSTR_FILE ${EXE_NAME}.instr.bc)
  add_custom_command(
    OUTPUT ${EXE_NAME}
    COMMAND ${CMAKE_C_COMPILER} ${CMAKE_C_FLAGS} ${CMAKE_THREAD_LIBS_INIT} ${TESLA_LINK} ${INSTR_FILE} -o ${EXE_NAME}
    DEPENDS ${INSTR_FILE}
  )
  add_custom_target(${EXE_NAME}-tesla-all
    ALL DEPENDS ${EXE_NAME}
  )
endfunction()
