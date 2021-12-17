#include "mbed.h"

DigitalOut led1(PTB18);
DigitalOut led2(PTB19);
DigitalOut led3(PTD1);

extern "C" int my_asm(uint32_t count_compare_value_led_1,
                      uint32_t count_compare_value_led_2,
                      uint32_t count_compare_value_led_3,
                      uint32_t max_count);

#define LED1_COUNT_VALUE 0x00100000ul
#define LED2_COUNT_VALUE 0x00080000Ful
#define LED3_COUNT_VALUE 0x00040000ul
#define MAX_VALUE LED1_COUNT_VALUE


int main() {
    my_asm(LED1_COUNT_VALUE, LED2_COUNT_VALUE, LED3_COUNT_VALUE, MAX_VALUE);
}
