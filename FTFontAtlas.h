
#ifndef FT_FONTATLAS_H
#define FT_FONTATLAS_H

#include <stdlib.h>
#ifdef _WIN32
#include "stdint.h"
#else
#include <stdint.h>
#endif
#include <ft2build.h> // FreeType header
#include FT_FREETYPE_H // unusual macro

namespace FTGL{
struct FTGL_GlyphInfos{
	float ax;	// advance.x
	float ay;	// advance.y

	float bw;	// bitmap.width
	float bh;	// bitmap.height

	float bl;	// bitmap.left
	float bt;	// bitmap.top
	float tx;	// x offset of glyph in texture coordinates
};

struct FTGL_FontAtlas{
	FTGL_GlyphInfos metadata[256];
	int width;
	int height;
	int size_px;
	unsigned char* buffer;
};


#ifdef __cplusplus
	extern "C" {
#endif
		extern FTGL_FontAtlas*	FT_CreateFontAtlas(const char* file_name, int size_px = 32, int err = -1);
		extern void					    FT_DeleteFontAtlas(FTGL_FontAtlas* atlas);
		/*
		long                 FT_GetAtlasWidth(FTGL_FontAtlas* atlas);
		long                 FT_GetAtlasHeight(FTGL_FontAtlas* atlas);
		void*                FT_GetAtlasBuffer(FTGL_FontAtlas* atlas);
		FTGL_GlyphInfos*     FT_GetGlyphMetadatas(FTGL_FontAtlas* atlas,int ID);
		*/
#ifdef __cplusplus
	}
#endif
}


#endif //GLT_TEST_H
