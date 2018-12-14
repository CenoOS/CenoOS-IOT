#include "../include/stm32l433xx.h"

#include <stdint.h>

/************************* Miscellaneous Configuration ************************/
/*!< Uncomment the following line if you need to relocate your vector Table in
     Internal SRAM. */
/* #define VECT_TAB_SRAM */
#define VECT_TAB_OFFSET  0x00 /*!< Vector Table base offset field.
                                   This value must be a multiple of 0x200. */
/******************************************************************************/
uint32_t SystemCoreClock = 4000000U;

/* Call the clock system intitialization function.*/
void SystemInit(void){
}

/* Call static constructors */
void __libc_init_array(){

}