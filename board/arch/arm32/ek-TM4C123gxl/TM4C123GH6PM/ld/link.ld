MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K /* FLASH size 256KB */
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 32K /* RAM size 32KB */

}

SECTIONS
{


    /* 
     * initial stack pointer pointing to top of stack,starts from higher addresses
     * i.e ORIGIN(RAM) + LENGTH(RAM)-1 in this case 0x20007FFF to lower addesses i.e
     * those lesser than 0x20007FFF to 0x2000000,which is the origina address of RAM,
     * until it comes in contact with .bss or .data in which case a buffer overflow occurs
    */
    PROVIDE( _stack_ptr = ORIGIN(RAM) + LENGTH(RAM));

    /* constants  and other code stored in FLASH */
    .text :
    {
        _text = .;               /* beginning of .text segment,also called code memory */
        KEEP(*(.vector_table)) /* vector table defined in startup.c to be included */
        *(.text*)                   /* other code */
        *(.rodata*)                /* constants go here */
        _etext = .;             /* end of .text segment */
    } > FLASH

    /* data, initialized variables, to be copied to RAM upon <RESET> by startup.c */
    .data : 
    {
        _data = .;          /* beginning of .data segment */
        *(.data*)           /* data goes here */
        _edata = .;         /* end of .data segment */
    } > RAM AT >FLASH   /* .data segment starts directly after the .text section in FLASH */

    /* uninitialized data which is initialized to 0 upon <RESET> by startup.c */
    .bss :
    {
        _bss = .;       /* beginning of .bss segment */
        *(.bss*)        /* .bss content goes here */
        *(COMMON)       
        _ebss = .;      /* end of .bss segment */
    } > RAM



}