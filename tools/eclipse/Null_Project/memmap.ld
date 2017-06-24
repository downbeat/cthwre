MEMORY
{
   ram : ORIGIN = 0xB0000000, LENGTH = 0x14000
}
SECTIONS
{
   .text : { *(.text*) } > ram
   .bss : { *(.bss*) } > ram
}
