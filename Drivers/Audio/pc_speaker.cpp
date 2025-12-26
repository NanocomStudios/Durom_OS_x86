#include "pc_speaker.h"
#include "../PIC/timer.h"
#include "../../IO/io.h"

#include <cstdint>

 //Play sound using built-in speaker
void play_sound(uint32_t nFrequence) {
 	uint32_t Div;
 	uint8_t tmp;
 
        //Set the PIT to the desired frequency
 	setTimer(nFrequence, 2, SQR_WAVE_GENERATOR);
 
        //And play the sound using the PC speaker
 	tmp = inb(0x61);
  	if (tmp != (tmp | 3)) {
 		outb(0x61, tmp | 3);
 	}
 }
 
 //make it shut up
void nosound() {
 	uint8_t tmp = inb(0x61) & 0xFC;
     
 	outb(0x61, tmp);
 }
 
 //Make a beep
void beep() {
 	 play_sound(1000);
 }