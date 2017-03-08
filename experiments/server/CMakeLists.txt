set(SERVER_SRCS
  server.c
  server_handler.c
  protocol.c
)


set(CLIENT_SRCS
  client.c
  protocol.c
)

add_tesla_executable("${SERVER_SRCS}" server TRUE)
add_tesla_executable("${CLIENT_SRCS}" client TRUE)
