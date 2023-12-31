#include "FTFontAtlas.h"

namespace FTGL{
	int FT_GetAtlasWidth(FTGL_FontAtlas* atlas){
		return atlas->width;
	}

	int FT_GetAtlasHeight(FTGL_FontAtlas* atlas){
		return atlas->height;
	}

	void* FT_GetAtlasBuffer(FTGL_FontAtlas* atlas){
		return atlas->buffer;
		/*
		for(uint32_t y=0;y<atlas->height;y++){
		for(uint32_t x=0;x<atlas->width;x++){
		buffer[y*atlas->width+x] = atlas->buffer[y*atlas->width+x];
		}
		}
		*/
	}

	FTGL_GlyphInfos* FT_GetGlyphMetadatas(FTGL_FontAtlas* atlas, int ID){
		if (ID < 0 || ID >= 256)ID = 0;
		return &atlas->metadata[ID];
	}

	FTGL_FontAtlas* FT_CreateFontAtlas(const char* file_name, int size_px, int err)
	{
		FT_Library ft;
    if (FT_Init_FreeType(&ft)) {
			fprintf(stderr, "Could not init FreeType library\n");
			err = 1;
			return NULL;
		}

		FT_Face face;
		if (FT_New_Face(ft, file_name, 0, &face)) {
			fprintf(stderr, "Could not open font\n");
			err = 2;
			return NULL;
		}

		FT_Set_Pixel_Sizes(face, 0, size_px);

		FTGL_FontAtlas* atlas = (FTGL_FontAtlas*)malloc(sizeof(FTGL_FontAtlas));
		FT_GlyphSlot g = face->glyph;
		atlas->size_px = size_px;
		size_t w = 0;
		size_t h = 0;

		int kFirst = 0;
		int kLast = 256;

		int padding = 7;

		// Get Atlas Infos
		for (int i = kFirst; i < kLast; i++) {
			if (FT_Load_Char(face, i, FT_LOAD_RENDER)) {
				fprintf(stderr, "Loading character %c failed!\n", i);
				continue;
			}

			w += g->bitmap.width + padding;
      if(g->bitmap.rows > h) h = g->bitmap.rows;
  
			//h = g->bitmap.rows > h ? g->bitmap.rows : h;
			//h = std::max(h, g->bitmap.rows);
		}
		atlas->width = static_cast<int>(w);
		atlas->height = static_cast<int>(h);

		// Allocate Buffer
		size_t buffer_size = w * h * sizeof (unsigned char);
		atlas->buffer = (unsigned char*)malloc(buffer_size);
		//sunsigned int atlas_buffer_index = 0;

		int x = 0;

		// Setup Buffer/MetaDatas
		for (int i = kFirst; i < kLast; i++) {
			if (FT_Load_Char(face, i, FT_LOAD_RENDER))
				continue;

			// Copy Buffer
			//glTexSubImage2D(GL_TEXTURE_2D, 0, x, 0, g->bitmap.width, g->bitmap.rows, GL_ALPHA, GL_UNSIGNED_BYTE, g->bitmap.buffer);
			for (size_t by = 0; by < g->bitmap.rows; by++){
				for (size_t bx = 0; bx < g->bitmap.width; bx++){
					atlas->buffer[by*atlas->width + x + bx] = g->bitmap.buffer[by*g->bitmap.width + bx];
				}
			}

			// Set MetaDatas
			atlas->metadata[i].ax = static_cast<float>(g->advance.x >> 6);
			atlas->metadata[i].ay = static_cast<float>(g->advance.y >> 6);

			atlas->metadata[i].bw = static_cast<float>(g->bitmap.width);
			atlas->metadata[i].bh = static_cast<float>(g->bitmap.rows);

			atlas->metadata[i].bl = static_cast<float>(g->bitmap_left);
			atlas->metadata[i].bt = static_cast<float>(g->bitmap_top);

			atlas->metadata[i].tx = (float)x / atlas->width;
			x += g->bitmap.width + padding;
		}

		//err = 0;
		return atlas;
	}

	void FT_DeleteFontAtlas(FTGL_FontAtlas* atlas)
	{
		//free(atlas->metadata);
		free(atlas->buffer);
		free(atlas);
	}

}