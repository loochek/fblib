#include "fblib.h"

#include "fonts/default_font.h"

#include "images/tux.h"
#include "images/alpha_test.h"
#include "images/alpha_test2.h"

int main()
{
    if (fb_init() < 0)
		return -1;
	clear();
	
	fill_rect(0, 0, 1080, 1920, 0, 0, 255, 255);
	fill_rect(100, 100, 880, 1720, 0, 255, 0, 255);
	fill_rect(200, 200, 680, 1520, 101, 67, 33, 255);
	label(200, 200, "Example text\n0123456789\n,./\\!&^%$#@", default_font);
	image(200, 272, tux);
	sub_image(400, 272, 40, 0, 100, 100, tux);
	label(200, 452, "This is another\nuseless garbage\ncreated by me", default_font);
	image(200, 500, alpha_test);
	image(200, 1000, alpha_test2);
	
	update();
	fb_close();
    return 0;
}