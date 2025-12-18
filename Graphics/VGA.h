#ifndef SCREEN
#define SCREEN

// #define consoleWidth 80
// #define consoleHeight 42

#define charWidth 9
#define charHeight 14

#define BLACK {0,0,0}
#define BLUE {127,0,0}
#define GREEN {0,127,0}
#define CYAN {127,127,0}
#define RED {0,0,127}
#define MAGENTA {127,0,127}
#define BROWN {0,127,127}
#define WHITE {127,127,127}

#define GRAY {64,64,64}
#define LIGHT_BLUE {255,0,0}
#define LIGHT_GREEN {0,255,0}
#define LIGHT_CYAN {255,255,0}
#define LIGHT_RED {0,0,255}
#define LIGHT_MAGENTA {255,0,255}
#define LIGHT_BROWN {0,255,255}
#define LIGHT_WHITE {255,255,255}

class Color{
	public:
	unsigned char B;
	unsigned char G;
	unsigned char R;
};

class Color32{
	public:
	unsigned char B;
	unsigned char G;
	unsigned char R;
	unsigned char I = 0xFF;

	Color32& operator = (const Color& color){
		B = color.B;
		G = color.G;
		R = color.R;
		return *this;
	}

};


void clearScreen();
void clearConsole();
void initScreen();
void printDisplayInfo();
void print(const char* inp);
void moveCsr(int col, int row);
void print(char inp);
void printInt(long inp);
void printHex(long inp);
void printHexV(long inp);
int len(long inp);
int lenH(long inp);
char hexToAscii(char inp);
void csrInc();
void scrollScreen();
void csrDec();
void setForeColor(char color);
void setBackColor(char color);
void setColor(int col, int row, char fgC, char bgC);
void drawLine(short x1, short y1, short x2, short y2, Color color);
void drawRectangle(short x1, short y1, short x2, short y2, Color color);
void fillRectangle(short x1, short y1, short x2, short y2, Color fillColor);
Color antiAliasing(float inp, Color color);
void drawChar(char inp, short x, short y, Color fgColor, Color bgColor);

struct VesaInfoBlock{
    unsigned short attributes;		// deprecated, only bit 7 should be of interest to you, and it indicates the mode supports a linear frame buffer.
	unsigned char window_a;			// deprecated
	unsigned char window_b;			// deprecated
	unsigned short granularity;		// deprecated; used while calculating bank numbers
	unsigned short window_size;
	unsigned short segment_a;
	unsigned short segment_b;
	unsigned int win_func_ptr;		// deprecated; used to switch banks from protected mode without returning to real mode
	unsigned short pitch;			// number of bytes per horizontal line
	unsigned short width;			// width in pixels
	unsigned short height;			// height in pixels
	unsigned char w_char;			// unused...
	unsigned char y_char;			// ...
	unsigned char planes;
	unsigned char bpp;			// bits per pixel in this mode
	unsigned char banks;			// deprecated; total number of banks in this mode
	unsigned char memory_model;
	unsigned char bank_size;		// deprecated; size of a bank, almost always 64 KB but may be 16 KB...
	unsigned char image_pages;
	unsigned char reserved0;

	unsigned char red_mask;
	unsigned char red_position;
	unsigned char green_mask;
	unsigned char green_position;
	unsigned char blue_mask;
	unsigned char blue_position;
	unsigned char reserved_mask;
	unsigned char reserved_position;
	unsigned char direct_color_attributes;

	unsigned int framebuffer;		// physical address of the linear frame buffer; write here to draw to the screen
	unsigned int off_screen_mem_off;
	unsigned short off_screen_mem_size;	// size of memory in the framebuffer but not being displayed on the screen
};



#endif