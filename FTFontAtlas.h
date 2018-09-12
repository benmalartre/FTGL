
#ifndef FT_FONTATLAS_H
#define FT_FONTATLAS_H

namespace FTGL{
#ifdef _WIN32
#include "stdint.h"
#else
#include <stdint.h>
#endif
#include <ft2build.h> // FreeType header
#include FT_FREETYPE_H // unusual macro

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
		uint64_t width;
		uint64_t height;
		uint64_t size_px;
		unsigned char* buffer;
	};


#ifdef __cplusplus
	extern "C" {
#endif
		extern int					FT_InitFreeType();
		extern int					FT_TestNewFace(const char* file_name, int size_px = 32);
		extern FTGL_FontAtlas*		FT_CreateFontAtlas(const char* file_name, int size_px = 32, int err = -1);
		extern void					FT_DeleteFontAtlas(FTGL_FontAtlas* atlas);
		/*
		extern long                 FT_GetAtlasWidth(FTGL_FontAtlas* atlas);
		extern long                 FT_GetAtlasHeight(FTGL_FontAtlas* atlas);
		extern void*                FT_GetAtlasBuffer(FTGL_FontAtlas* atlas);
		extern FTGL_GlyphInfos*     FT_GetGlyphMetadatas(FTGL_FontAtlas* atlas,int ID);
		*/
#ifdef __cplusplus
	}
#endif
}


#endif //GLT_TEST_H
