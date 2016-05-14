#include <iostream>
#include <string>
#include <fstream>
#include <stdlib.h>     /* system, NULL, EXIT_FAILURE */

#include "tcp.h"
#include "unistd.h"

using namespace std;

#define TAM 200
static int port = 9000;

void agregaLinea(const char* path, char* line) {
	std::ofstream outfile;
//	outfile.open(path, std::ios_base::out);
	outfile.open(path, std::ios_base::app);
	outfile << line;
	outfile << std::endl;
	outfile.close();
}

void run() {
	system("wine /home/daniel/workspace/botRcv/AutoIt3.exe ./test.au3 ");
}


int main(){
	const char* path = "./test.au3";

	// run();

  	int fd = tcp_open_pasivo("0.0.0.0", port);
  	while(1){
    		int clientfd = accept(fd, (struct sockaddr*) NULL, NULL);

		char respuesta[TAM];
		read(clientfd,respuesta,TAM);

		cout << "llego: " << respuesta << endl; 
    		agregaLinea(path, respuesta);
//		run();

    		close(clientfd);
  	}
}
