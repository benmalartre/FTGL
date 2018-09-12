# FTGL makefile

# Macros
INCLUDES = -Ifreetype-2.4.0/include
LIBS = -lfreetype
CFLAGS = -Wall -static

# Rules
all: main ftgl.a

main: FTFontAtlas.cpp FTFontAtlas.h
	g++ -c -o FTGL  $(CFLAGS) FTFontAtlas.cpp $(INCLUDES)

ftgl.a: FTGL
	        ar rcs $@ $^

clean:
	rm -rf *.o FTGL