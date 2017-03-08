#include <errno.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void usage(char *me) {
  fprintf(stderr, "usage: %s server port\n", me);
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

  return 0;
}
