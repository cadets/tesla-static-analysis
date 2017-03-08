set(SRCS
  main.c
  protocol.c
)

add_tesla_executable("${SRCS}" server TRUE)
