#ifndef TIMER_H
#define TIMER_H

#include <cstdint>

#define RATE_GENERATOR 2
#define SQR_WAVE_GENERATOR 3

void setTimer(uint32_t frequency, uint8_t timer, uint8_t operatingMode = SQR_WAVE_GENERATOR, uint8_t bcd = 0);

#endif