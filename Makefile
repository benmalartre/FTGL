# FTGL makefile

# Macros
INCLUDES = -I../freetype-2.4.0/include
LIBS = -lfreetype
CFLAGS = -Wall -static

# Rules
all: main ftgl.a

main: FTFontAtlas.cpp FTFontAtlas.h
	g++ -c -o FTGL  $(CFLAGS) FTFontAtlas.cpp $(INCLUDES)

ftgl.a: FTGL
	        ar rcs $@ $^
deploy:
	cp ftgl.a /home/benmalartre/RnD/PureBasic/Noodle/libs/x64/linux/ftgl.a
clean:
	rm -rf *.o *.a *.so FTGL
