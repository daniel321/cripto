#include <SDL2/SDL.h>
#include <fstream> 
#include <sstream> 
#include <iostream>
#include <string>

#include <stdlib.h>     /* system, NULL, EXIT_FAILURE */

#define TAM 200
#define TIMEOUT 100000

using namespace std;

static int width  = 1280;
static int height = 768;
static int port   = 9500;
static string ip  = "192.168.1.132";
static string ip2  = "192.168.1.129";
static string ip3  = "127.0.0.1";
static string ip4  = "10.1.135.153";

static string path = "test.au3";
static string pathJar = "sender.jar";

bool salir,shift,caps,mouseMoved = false;
float x=0,y=0,timer = 0;


void emptyFile(){
	std::fstream fs(path.c_str(),std::ios::out | std::ios::trunc);
}

void sendMessage(){
	cout << "sending:" << endl;	

	std::ifstream archi;
	archi.open(path.c_str());

	string line;
	while(getline(archi,line)){
		cout << line << endl;
	}
	archi.close();
	string command;
	command = "java -jar " + pathJar;
	system(command.c_str());
	emptyFile();
}

void addCommand(string command){
	std::ofstream archi;
	archi.open(path.c_str(),std::ios::in | std::ios::out | std::ios::app);
	archi << command;
	archi << endl;
}

void addCommonKey(string key){
	stringstream msg;
	msg << "Send(\"";
	msg << key;
	msg << "\")";
	
	addCommand(msg.str());
}

void addSpecialKey(string key){
	stringstream msg;
	msg << "Send(\"{";
	msg << key;
	msg << "}\")";

	addCommand(msg.str());
}

void addMouseClick(float x,float y,string button){
	stringstream msg;
	msg << "MouseClick(\"";
	msg << button;
	msg << "\", ";
	msg << x;
	msg << ", ";
	msg << y;
	msg << ")\n";

	addCommand(msg.str());
}

void addMouseMotion(float x,float y){

	stringstream msg;
	msg << "MouseMove(";
	msg << x;
	msg << ", ";
	msg << y;
	msg << ")\n";

	addCommand(msg.str());
}

void addOpenProgramOrder(string program){
	string command;
	command = "sleep(1500)";

	addCommonKey("#r");
	addSpecialKey("BACKSPACE");
	addCommonKey(program);
	addSpecialKey("ENTER");	
	addCommand(command.c_str());
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

	    		case SDL_MOUSEMOTION: 
			{
				x = event.button.x;
				y = event.button.y;

				if(caps)
					mouseMoved = true;
			}
			break;


	    		case SDL_MOUSEBUTTONDOWN: 
			{
				x = event.button.x;
				y = event.button.y;
				mouseMoved = false;

				if(SDL_GetMouseState(NULL,NULL) & SDL_BUTTON(SDL_BUTTON_LEFT))
					addMouseClick(x,y,"left");
				else
					if(SDL_GetMouseState(NULL,NULL) & SDL_BUTTON(SDL_BUTTON_RIGHT))
						addMouseClick(x,y,"right");
				
			}
			break;

	    		case SDL_KEYDOWN:  
				int keyPressed = event.key.keysym.sym;

			   	switch (keyPressed){
				   case SDLK_F1:
				      addOpenProgramOrder("cmd");	
				      break;
				   case SDLK_F2:
				      addOpenProgramOrder("Firefox");	
				      break;
				   case SDLK_F3:
				      addOpenProgramOrder("Chrome");	
				      break;
				   case SDLK_F4:
				      addOpenProgramOrder("Notepad++");	
				      break;
				   case SDLK_F5:
				      addOpenProgramOrder("wordpad");	
				      break;

				   case SDLK_F7:
				      addCommonKey("Soy Dios {ENTER}");	
				      break;
				   case SDLK_F8:
				      addCommonKey("Juana...");	
				      break;
				   case SDLK_F9:
				      addCommonKey("dame tu postre");	
				      break;


				   case SDLK_LEFT:
				      addSpecialKey("LEFT");	
				      break;
				   case SDLK_RIGHT:
				      addSpecialKey("RIGHT");	
				      break;
				   case SDLK_UP:
				      addSpecialKey("UP");
				      break;
				   case SDLK_DOWN:
				      addSpecialKey("DOWN");
				      break;

				   case SDLK_TAB:
				      addSpecialKey("TAB");
				      break;
				   case SDLK_ESCAPE:
				      salir = true;
				      break;
				   case SDLK_SPACE:
				      addSpecialKey("SPACE");
				      break;
				   case SDLK_BACKSPACE:
				      addSpecialKey("BACKSPACE");
				      break;
				   case SDLK_RETURN:
				      if(caps)
				      	sendMessage();
				      else
				      	addSpecialKey("ENTER");
				      break;

				   case SDLK_LALT:
				      addSpecialKey("");
				      break;

				   case SDLK_KP_MULTIPLY:
				      addCommonKey("*");
				      break;
				   case SDLK_KP_DIVIDE:
				      addCommonKey("/");
				      break;
				   case SDLK_KP_PLUS:
				      addCommonKey("+");
				      break;
				   case SDLK_KP_MINUS:
				      addCommonKey("-");
				      break;
				   case SDLK_KP_PERIOD:
				      addCommonKey(".");
				      break;

				   case 124:
				      addSpecialKey("|");
				      break;
				   case SDLK_KP_0:
				      addCommonKey("0");
				      break;
				   case SDLK_KP_1:
				      addCommonKey("1");
				      break;
				   case SDLK_KP_2:
				      addCommonKey("2");
				      break;
				   case SDLK_KP_3:
				      addCommonKey("3");
				      break;
				   case SDLK_KP_4:
				      addCommonKey("4");
				      break;
				   case SDLK_KP_5:
				      addCommonKey("5");
				      break;
				   case SDLK_KP_6:
				      addCommonKey("6");
				      break;
				   case SDLK_KP_7:
				      addCommonKey("7");
				      break;
				   case SDLK_KP_8:
				      addCommonKey("8");
				      break;
				   case SDLK_KP_9:
				      addCommonKey("9");
				      break;

				   case SDLK_RSHIFT:
				      shift = true;
				      break;

				   case SDLK_0:
				      if(shift)
					      addCommonKey("=");
				      else
					      addCommonKey("0");
				      break;
				   case SDLK_1:
				      if(shift)
					      addSpecialKey("!");
				      else
					      addCommonKey("1");
				      break;
				   case SDLK_2:
				      if(shift)
					      addSpecialKey("& Chr(34) &");
				      else
					      addCommonKey("2");
				      break;
				   case SDLK_3:
				      if(shift)
					      addSpecialKey("#");
				      else
					      addCommonKey("3");
				      break;
				   case SDLK_4:
				      if(shift)
					      addSpecialKey("$");
				      else
					      addCommonKey("4");
				      break;
				   case SDLK_5:
				      if(shift)
					      addSpecialKey("%");
				      else
					      addCommonKey("5");
				      break;
				   case SDLK_6:
				      if(shift)
					      addSpecialKey("&");
				      else
					      addCommonKey("6");
				      break;
				   case SDLK_7:
				      if(shift)
					      addSpecialKey("/");
				      else
					      addCommonKey("7");
				      break;
				   case SDLK_8:
				      if(shift)
					      addSpecialKey("(");
				      else
					      addCommonKey("8");
				      break;
				   case SDLK_9:				      
				      if(shift)
					      addSpecialKey(")");
				      else
					      addCommonKey("9");
				      break;
				   case SDLK_COMMA:
				      if(shift)
					      addCommonKey(";");
				      else
				 	      addCommonKey(",");
				      break;
				   case SDLK_PERIOD:
				      if(shift)
					      addCommonKey(":");
				      else
				 	      addCommonKey(".");
				      break;
				   case SDLK_PLUS:
				      if(shift)
					      addCommonKey("*");
				      else
				 	      addCommonKey("+");
				      break;
				   case SDLK_QUOTE:
				      if(shift)
					      addSpecialKey("?");
				      else
					      addSpecialKey("& Chr(39) &");
				      break;
				   case SDLK_MINUS:
				      if(shift)
					      addCommonKey("_");
				      else
				 	      addCommonKey("-");
				      break;
				   case SDLK_LESS:
				      if(shift)
					      addCommonKey("<");
				      else
				 	      addCommonKey(">");
				      break;
 	
				   case SDLK_CAPSLOCK:
				      caps = !caps;
				      break;

				   case SDLK_a:
				      if(caps)
					      addCommonKey("A");
				      else
				 	      addCommonKey("a");
				      break;
				   case SDLK_b:
				      if(caps)
					      addCommonKey("B");
				      else
				 	      addCommonKey("b");
				      break;
				   case SDLK_c:
				      if(caps)
					      addCommonKey("C");
				      else
				 	      addCommonKey("c");
				      break;
				   case SDLK_d:
				      if(caps)
					      addCommonKey("D");
				      else
				 	      addCommonKey("d");
				      break;
				   case SDLK_e:
				      if(caps)
					      addCommonKey("E");
				      else
				 	      addCommonKey("e");
				      break;
				   case SDLK_f:
				      if(caps)
					      addCommonKey("F");
				      else
				 	      addCommonKey("f");
				      break;
				   case SDLK_g:
				      if(caps)
					      addCommonKey("G");
				      else
				 	      addCommonKey("g");
				      break;
				   case SDLK_h:
				      if(caps)
					      addCommonKey("H");
				      else
				 	      addCommonKey("h");
				      break;
				   case SDLK_i:
				      if(caps)
					      addCommonKey("I");
				      else
				 	      addCommonKey("i");
				      break;
				   case SDLK_j:
				      if(caps)
					      addCommonKey("J");
				      else
				 	      addCommonKey("j");
				      break;
				   case SDLK_k:
				      if(caps)
					      addCommonKey("K");
				      else
				 	      addCommonKey("k");
				      break;
				   case SDLK_l:
				      if(caps)
					      addCommonKey("L");
				      else
				 	      addCommonKey("l");
				      break;
				   case SDLK_m:
				      if(caps)
					      addCommonKey("M");
				      else
				 	      addCommonKey("m");
				      break;
				   case SDLK_n:
				      if(caps)
					      addCommonKey("N");
				      else
				 	      addCommonKey("n");
				      break;
				   case SDLK_o:
				      if(caps)
					      addCommonKey("O");
				      else
				 	      addCommonKey("o");
				      break;
				   case SDLK_p:
				      if(caps)
					      addCommonKey("P");
				      else
				 	      addCommonKey("p");
				      break;
				   case SDLK_q:
				      if(caps)
					      addCommonKey("Q");
				      else
				 	      addCommonKey("q");
				      break;
				   case SDLK_r:
				      if(caps)
					      addCommonKey("R");
				      else
				 	      addCommonKey("r");
				      break;
				   case SDLK_s:
				      if(caps)
					      addCommonKey("S");
				      else
				 	      addCommonKey("s");
				      break;
				   case SDLK_t:
				      if(caps)
					      addCommonKey("T");
				      else
				 	      addCommonKey("t");
				      break;
				   case SDLK_u:
				      if(caps)
					      addCommonKey("U");
				      else
				 	      addCommonKey("u");
				      break;
				   case SDLK_v:
				      if(caps)
					      addCommonKey("V");
				      else
				 	      addCommonKey("v");
				      break;
				   case SDLK_w:
				      if(caps)
					      addCommonKey("W");
				      else
				 	      addCommonKey("w");
				      break;
				   case SDLK_x:
				      if(caps)
					      addCommonKey("X");
				      else
				 	      addCommonKey("x");
				      break;
				   case SDLK_y:
				      if(caps)
					      addCommonKey("Y");
				      else
				 	      addCommonKey("y");
				      break;
				   case SDLK_z:
				      if(caps)
					      addCommonKey("Z");
				      else
				 	      addCommonKey("z");
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
	SDL_Surface *surf = SDL_GetWindowSurface(screen);
	SDL_FillRect(surf,NULL,SDL_MapRGB(surf->format,0xFF,0xFF,0xFF));

	salir = false;
	while(!salir){
		handleImput();

		if(timer > TIMEOUT ){
			SDL_UpdateWindowSurface(screen);
			if(mouseMoved){
				addMouseMotion(x,y);
				mouseMoved = false;
			}
			timer = 0;
		}
		timer++;
	}
	SDL_Delay(2000);
	SDL_Quit();

    return 0;
}


