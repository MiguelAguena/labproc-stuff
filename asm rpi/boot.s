.include "gpio.inc"

// este dever ser o endereço 0x8000
.text
.global start
start:
   // inicia stack pointer
   ldr sp, =stack_addr

   // configurar GPIO 21 como saída
   ldr r0, =GPFSEL2
   ldr r1, [r0]
   bic r1, r1, #(0b111 << 3)
   orr r1, r1, #(0b001 << 3)
   str r1, [r0]

loop:
   // acende
   ldr r0, =GPSET0
   mov r1, #(1 << 21)
   str r1, [r0]

   // delay
   mov r0, #0x400000
   bl delay

   // apaga
   ldr r0, =GPCLR0
   mov r1, #(1 << 21)
   str r1, [r0]

   // delay
   mov r0, #0x400000
   bl delay

   b loop

delay:
   cmp r0, #0
   moveq pc, lr
   sub r0, r0, #1
   b delay