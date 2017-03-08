#include <assert.h>
#include <errno.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>

void usage(char *me) {
  fprintf(stderr, "usage: %s server port\n", me);
}

struct sockaddr_in addr_from_args(struct hostent *server, long port) {
  struct sockaddr_in serv_addr;

  serv_addr.sin_family = AF_INET;
  bcopy(
      (char *)server->h_addr,
      (char *)&serv_addr.sin_addr.s_addr,
      server->h_length
  );
  serv_addr.sin_port = htons(port);

  return serv_addr;
}

int connect_to(struct hostent *server, long port) {
  int sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if(sockfd < 0) {
    fprintf(stderr, "Error creating socket (%s)\n", strerror(errno));
  }

  struct sockaddr_in serv_addr = addr_from_args(server, port);
  int conn = connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));

  if(conn < 0) {
    fprintf(stderr, "Error connecting (%s)\n", strerror(errno));
    return conn;
  }

  return sockfd;
}

int main(int argc, char **argv) {
  if(argc != 3) {
    usage(argv[0]);
    return 1;
  }

  struct hostent *server = gethostbyname(argv[1]);
  if(!server) {
    fprintf(stderr, "Could not locate server\n");
    return 2;
  }

  long port = atol(argv[2]);
  if(port <= 0) {
    fprintf(stderr, "Invalid port number: %s (%s)\n", argv[2], strerror(errno));
    return 3;
  }

  int sockfd = connect_to(server, port);
  if(sockfd < 0) {
    return 4;
  }

  return 0;
}
