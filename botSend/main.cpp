#include <SDL2/SDL.h>
#include <sstream> 
#include <iostream>
#include <string>
#include <fstream>
#include <string>

#include <stdlib.h>     /* system, NULL, EXIT_FAILURE */

#include "tcp.h"
#define TAM 200

using namespace std;

static int width  = 1024;
static int height = 768;
static int port   = 9500;
static string ip  = "10.1.72.213";
bool salir,shift,caps = false;

void sendMessage(string mens){
	cout << "sending: " << mens << endl;

	int socket = tcp_open_activo(ip.c_str(),port);
	cout << "sent" << endl;
	
	if(socket > 0){
		write(socket,mens.c_str(),TAM);
		close(socket);
	}

}

void sendSpecialKey(string key){
	stringstream msg;
	msg << "Send(\"{";
	msg << key;
	msg << "}\")";

	sendMessage(msg.str());
}

void sendCommonKey(string key){
	stringstream msg;
	msg << "Send(\"";
	msg << key;
	msg << "\")";

	sendMessage(msg.str());
}

void sendMouseClick(float x,float y){

	stringstream msg;
	msg << "MouseClick(\"left\", ";
	msg << x;
	msg << ", ";
	msg << y;
	msg << ")\n";

	sendMessage(msg.str());
}


void handleImput(){
	SDL_Event event;
	while(SDL_PollEvent(&event)){  
		switch(event.type){  
			case SDL_QUIT:
				salir = true;
			break;

			case SDL_KEYUP:
				if ( event.key.keysym.sym == SDLK_RSHIFT){
				     shift = false;
				}
			break;  

	    		case SDL_MOUSEBUTTONDOWN: 
			{
				float x = event.button.x;
				float y = event.button.y;

				sendMouseClick(x,y);
			}
			break;

	    		case SDL_KEYDOWN:  
				int keyPressed = event.key.keysym.sym;

			   	switch (keyPressed){
				   case SDLK_LEFT:
				      sendSpecialKey("LEFT");	
				      break;
				   case SDLK_RIGHT:
				      sendSpecialKey("RIGHT");	
				      break;
				   case SDLK_UP:
				      sendSpecialKey("UP");
				      break;
				   case SDLK_DOWN:
				      sendSpecialKey("DOWN");
				      break;

				   case SDLK_TAB:
				      sendSpecialKey("TAB");
				      break;
				   case SDLK_ESCAPE:
				      salir = true;
				      break;
				   case SDLK_SPACE:
				      sendSpecialKey("SPACE");
				      break;
				   case SDLK_BACKSPACE:
				      sendSpecialKey("BACKSPACE");
				      break;
				   case SDLK_RETURN:
				      sendSpecialKey("ENTER");
				      break;

				   case SDLK_LALT:
				      sendSpecialKey("");
				      break;

				   case SDLK_KP_MULTIPLY:
				      sendCommonKey("*");
				      break;
				   case SDLK_KP_DIVIDE:
				      sendCommonKey("/");
				      break;
				   case SDLK_KP_PLUS:
				      sendCommonKey("+");
				      break;
				   case SDLK_KP_MINUS:
				      sendCommonKey("-");
				      break;
				   case SDLK_KP_PERIOD:
				      sendCommonKey(".");
				      break;

				   case 124:
				      sendSpecialKey("|");
				      break;
				   case SDLK_KP_0:
				      sendCommonKey("0");
				      break;
				   case SDLK_KP_1:
				      sendCommonKey("1");
				      break;
				   case SDLK_KP_2:
				      sendCommonKey("2");
				      break;
				   case SDLK_KP_3:
				      sendCommonKey("3");
				      break;
				   case SDLK_KP_4:
				      sendCommonKey("4");
				      break;
				   case SDLK_KP_5:
				      sendCommonKey("5");
				      break;
				   case SDLK_KP_6:
				      sendCommonKey("6");
				      break;
				   case SDLK_KP_7:
				      sendCommonKey("7");
				      break;
				   case SDLK_KP_8:
				      sendCommonKey("8");
				      break;
				   case SDLK_KP_9:
				      sendCommonKey("9");
				      break;

				   case SDLK_RSHIFT:
				      shift = true;
				      break;

				   case SDLK_0:
				      if(shift)
					      sendCommonKey("=");
				      else
					      sendCommonKey("0");
				      break;
				   case SDLK_1:
				      if(shift)
					      sendSpecialKey("!");
				      else
					      sendCommonKey("1");
				      break;
				   case SDLK_2:
				      if(shift)
					      sendSpecialKey("& Chr(34) &");
				      else
					      sendCommonKey("2");
				      break;
				   case SDLK_3:
				      if(shift)
					      sendSpecialKey("#");
				      else
					      sendCommonKey("3");
				      break;
				   case SDLK_4:
				      if(shift)
					      sendSpecialKey("$");
				      else
					      sendCommonKey("4");
				      break;
				   case SDLK_5:
				      if(shift)
					      sendSpecialKey("%");
				      else
					      sendCommonKey("5");
				      break;
				   case SDLK_6:
				      if(shift)
					      sendSpecialKey("&");
				      else
					      sendCommonKey("6");
				      break;
				   case SDLK_7:
				      if(shift)
					      sendSpecialKey("/");
				      else
					      sendCommonKey("7");
				      break;
				   case SDLK_8:
				      if(shift)
					      sendSpecialKey("(");
				      else
					      sendCommonKey("8");
				      break;
				   case SDLK_9:				      
				      if(shift)
					      sendSpecialKey(")");
				      else
					      sendCommonKey("9");
				      break;
				   case SDLK_COMMA:
				      if(shift)
					      sendCommonKey(";");
				      else
				 	      sendCommonKey(",");
				      break;
				   case SDLK_PERIOD:
				      if(shift)
					      sendCommonKey(":");
				      else
				 	      sendCommonKey(".");
				      break;
				   case SDLK_PLUS:
				      if(shift)
					      sendCommonKey("*");
				      else
				 	      sendCommonKey("+");
				      break;
				   case SDLK_QUOTE:
				      if(shift)
					      sendSpecialKey("?");
				      else
					      sendSpecialKey("& Chr(39) &");
				      break;
				   case SDLK_MINUS:
				      if(shift)
					      sendCommonKey("_");
				      else
				 	      sendCommonKey("-");
				      break;
				   case SDLK_LESS:
				      if(shift)
					      sendCommonKey("<");
				      else
				 	      sendCommonKey(">");
				      break;
 	
				   case SDLK_CAPSLOCK:
				      caps = !caps;
				      break;

				   case SDLK_a:
				      if(caps)
					      sendCommonKey("A");
				      else
				 	      sendCommonKey("a");
				      break;
				   case SDLK_b:
				      if(caps)
					      sendCommonKey("B");
				      else
				 	      sendCommonKey("b");
				      break;
				   case SDLK_c:
				      if(caps)
					      sendCommonKey("C");
				      else
				 	      sendCommonKey("c");
				      break;
				   case SDLK_d:
				      if(caps)
					      sendCommonKey("D");
				      else
				 	      sendCommonKey("d");
				      break;
				   case SDLK_e:
				      if(caps)
					      sendCommonKey("E");
				      else
				 	      sendCommonKey("e");
				      break;
				   case SDLK_f:
				      if(caps)
					      sendCommonKey("F");
				      else
				 	      sendCommonKey("f");
				      break;
				   case SDLK_g:
				      if(caps)
					      sendCommonKey("G");
				      else
				 	      sendCommonKey("g");
				      break;
				   case SDLK_h:
				      if(caps)
					      sendCommonKey("H");
				      else
				 	      sendCommonKey("h");
				      break;
				   case SDLK_i:
				      if(caps)
					      sendCommonKey("I");
				      else
				 	      sendCommonKey("i");
				      break;
				   case SDLK_j:
				      if(caps)
					      sendCommonKey("J");
				      else
				 	      sendCommonKey("j");
				      break;
				   case SDLK_k:
				      if(caps)
					      sendCommonKey("K");
				      else
				 	      sendCommonKey("k");
				      break;
				   case SDLK_l:
				      if(caps)
					      sendCommonKey("L");
				      else
				 	      sendCommonKey("l");
				      break;
				   case SDLK_m:
				      if(caps)
					      sendCommonKey("M");
				      else
				 	      sendCommonKey("m");
				      break;
				   case SDLK_n:
				      if(caps)
					      sendCommonKey("N");
				      else
				 	      sendCommonKey("n");
				      break;
				   case SDLK_o:
				      if(caps)
					      sendCommonKey("O");
				      else
				 	      sendCommonKey("o");
				      break;
				   case SDLK_p:
				      if(caps)
					      sendCommonKey("P");
				      else
				 	      sendCommonKey("p");
				      break;
				   case SDLK_q:
				      if(caps)
					      sendCommonKey("Q");
				      else
				 	      sendCommonKey("q");
				      break;
				   case SDLK_r:
				      if(caps)
					      sendCommonKey("R");
				      else
				 	      sendCommonKey("r");
				      break;
				   case SDLK_s:
				      if(caps)
					      sendCommonKey("S");
				      else
				 	      sendCommonKey("s");
				      break;
				   case SDLK_t:
				      if(caps)
					      sendCommonKey("T");
				      else
				 	      sendCommonKey("t");
				      break;
				   case SDLK_u:
				      if(caps)
					      sendCommonKey("U");
				      else
				 	      sendCommonKey("u");
				      break;
				   case SDLK_v:
				      if(caps)
					      sendCommonKey("V");
				      else
				 	      sendCommonKey("v");
				      break;
				   case SDLK_w:
				      if(caps)
					      sendCommonKey("W");
				      else
				 	      sendCommonKey("w");
				      break;
				   case SDLK_x:
				      if(caps)
					      sendCommonKey("X");
				      else
				 	      sendCommonKey("x");
				      break;
				   case SDLK_y:
				      if(caps)
					      sendCommonKey("Y");
				      else
				 	      sendCommonKey("y");
				      break;
				   case SDLK_z:
				      if(caps)
					      sendCommonKey("Z");
				      else
				 	      sendCommonKey("z");
				      break;
				}
			break;
		}	
	}
}

int main(){
	SDL_Init (SDL_INIT_VIDEO);
	SDL_Window *screen = SDL_CreateWindow("My Game Window",
                          SDL_WINDOWPOS_UNDEFINED,
                          SDL_WINDOWPOS_UNDEFINED,
                          width, height,SDL_WINDOW_OPENGL);


	salir = false;
	while(!salir){
		handleImput();
	}
	SDL_Delay(2000);
	SDL_Quit();

    return 0;
}


