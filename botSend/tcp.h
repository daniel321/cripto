#ifndef _TCP_H_
#define _TCP_H_
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/tcp.h>

/**
 * Abre un socket y lo conecta a un host y puerto.
 */
int tcp_open_activo(const char* host_name, uint16_t port){
    int fd = -1;
    struct sockaddr_in server;
    struct hostent *host;

    if((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        return -1;

    host = gethostbyname(host_name);
    if (host == NULL)
        return -2;
    
    memset(&server, 0, sizeof(server)); 
    
    server.sin_family = AF_INET;
    server.sin_family = host->h_addrtype;
    memcpy((char *)&(server.sin_addr.s_addr), (host->h_addr_list)[0], host->h_length);
    server.sin_port = htons(port);

    if(connect(fd, (struct sockaddr *)&server, sizeof(server)) < 0)
        return -3;
    
    return fd;
}


/**
 * Abre un socket y lo deja listo para recibir conexiones entrantes en un puerto.
 */
int tcp_open_pasivo(const char* host_name, uint16_t port){
    int fd = -1;
    struct sockaddr_in serv_addr;
    struct hostent *host;
    
    if((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
      return -1;

    host = gethostbyname(host_name);
    if (host == NULL)
      return -2;
    
    memset(&serv_addr, 0, sizeof(serv_addr));
    
    serv_addr.sin_family = host->h_addrtype;
    memcpy((char *)&(serv_addr.sin_addr.s_addr), (host->h_addr_list)[0], host->h_length);
    serv_addr.sin_port = htons(port);
    
    if(bind(fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) != 0)
        return -3;

    if(listen(fd, 20) < 0)
      return -4;

    return fd;
}

int tcp_open_pasivo(uint16_t port){
  return tcp_open_pasivo("0.0.0.0", port);
}

void tcp_disable_nagle(int sock){
    int flag = 1;
    int result = setsockopt(sock,            /* socket affected */
                            IPPROTO_TCP,     /* set option at TCP level */
                            TCP_NODELAY,     /* name of option */
                            (char *) &flag,  /* the cast is historical cruft */
                            sizeof(int));    /* length of option value */
}

#endif /* _TCP_H_ */
