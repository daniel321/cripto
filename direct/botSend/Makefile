CC     = g++
CFLAGS = -Wall -g

all: client

client: main.cpp
	g++ main.cpp `pkg-config --cflags --libs sdl2`

clean:
	rm -f *.o
	rm -f $(PROG)

