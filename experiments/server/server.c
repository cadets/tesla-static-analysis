#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

#include "protocol.h"

int main(int argc, char **argv) {
  int sockfd = socket(AF_INET, SOCK_STREAM, 0);
  struct sockaddr_in serv_addr = {
    .sin_family = AF_INET,
    .sin_port = htons(8080),
    .sin_addr = {
      .s_addr = INADDR_ANY
    }
  };

  int b = bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr));
  if(b < 0) {
    return 1;
  }

  struct sockaddr_in cli_addr;
  socklen_t cli_len = sizeof(cli_addr);

  listen(sockfd, 5);
  while(1) {
    int conn = accept(sockfd, (struct sockaddr *) &cli_addr, &cli_len);
    if(conn < 0) {
      printf("Not accepted: %s\n", strerror(errno));
    }

    char buf[256];
    int n = read(conn, buf, 256);
    printf("%s", buf);
  }

  return 0;
}
