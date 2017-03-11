set(SERVER_SRCS
  server.c
  server_handler.c
  protocol.c
)


set(CLIENT_SRCS
  client.c
  client_handler.c
  protocol.c
)

option(SERVER_USE_TESLA ON)

if(SERVER_USE_TESLA)
  set(CMAKE_C_FLAGS "-DUSE_TESLA ${CMAKE_C_FLAGS}")
endif()

add_tesla_executable("${SERVER_SRCS}" server TRUE)
add_tesla_executable("${CLIENT_SRCS}" client TRUE)
