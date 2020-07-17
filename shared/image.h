#ifndef image_h
#define image_h

struct image
{
	int width;
	int height;
	const unsigned char *data; // RGBA8888 32 * width * height
};

#endif