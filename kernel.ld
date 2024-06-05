/* Arquivo kernel.ld: linker script */ 
SECTIONS {
   .text 0x40000000 : {
      *(.text)
   }
   .data : {
      *(.data)
   }
}
