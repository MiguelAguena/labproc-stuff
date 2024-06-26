SECTIONS {
  . = 0x40000000;   /* 0x8000 para Raspberry Pi, 0x40000000 para qemu */
  .text : { 
     boot.o(.text)
     *(.text) 
  }

  . = ALIGN(4);
  .data : { *(.data) }

  . = ALIGN(4);
  inicio_bss = .;
  .bss : { *(.bss*) }
  fim_bss = .;

  . = ALIGN(8);
  inicio_heap = .;
  . = . + 32K;
  inicio_stack = .;
}