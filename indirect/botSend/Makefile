BUILD = build/
EXECUTABLE = botSend

CC     = g++
CFLAGS = -Wall -g

OUTFILE = $(BUILD)$(EXECUTABLE)

all: $(OUTFILE)

$(OUTFILE): main.cpp
	mkdir -p $(BUILD)
	$(CXX) main.cpp `pkg-config --cflags --libs sdl2`  -o $(OUTFILE)

clean:
	rm -rf $(BUILD)
