#ifndef font_h
#define font_h

#include "image.h"

struct font
{
	const char *charset;
	int char_width;
	int char_height;
	const struct image *graphics; // (strlen(charset) * char_width)x(char_height) size
};

#endif