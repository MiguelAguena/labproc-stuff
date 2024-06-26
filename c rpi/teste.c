#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdio.h>

#define OITO     8

int a[OITO];    // a vai estar em .bss

extern void main(void);
extern uint8_t inicio_bss;
extern uint8_t fim_bss;

void __attribute__((naked)) start(void) {
   asm volatile("ldr sp, =inicio_stack");
   memset(&inicio_bss, 0, &fim_bss - &inicio_bss);
   main();
}

void main(void) {
   int b[8];
   int *c = malloc(8 * sizeof(int));
   printf("a");
   for(;;) {
   }
}