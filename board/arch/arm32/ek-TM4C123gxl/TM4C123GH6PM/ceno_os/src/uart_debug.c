/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2019-01-27 
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#include "../include/uart_debug.h"
#include "TM4C123GH6PM.h"

#include "os_config.h"


#ifdef __CENO_RTOS_UART_DEBUG_ON__
	void uart_debug_init(void){
		// 1. Enable the UART module using the RCGCUART register (see page 319).
		SYSCTL->RCGCUART |= (1<<0);

		// 2. Enable the clock to the appropriate GPIO module via the RCGCGPIO register (see page 315).
	    //     To find out which GPIO port to enable, refer to Table 21-5 on page 1142.
		SYSCTL->RCGCGPIO |= (1<<0);

	    // 3. Set the GPIO AFSEL bits for the appropriate pins (see page 632). To determine which GPIOs to
	    //    configure, see Table 21-4 on page 1138.
		GPIOA->AFSEL = (1<<1) | (1<<0);

		// 4. Configure the GPIO current level and/or slew rate as specified for the mode selected (see
		//     page 634 and page 642).

		// 5. Configure the PMCn fields in the GPIOPCTL register to assign the UART signals to the appropriate
		//     pins (see page 649 and Table 21-5 on page 1142).
		GPIOA->PCTL = (1<<0) | (1<<4);

		GPIOA->DEN =  (1<<0) | (1<<1);

		// BRD = 20,000,000 / (16 * 115,200) = 10.8507
		// UARTFBRD[DIVFRAC] = integer(0.8507 * 64 + 0.5) = 5
		// BRD = 16,000,000 / (16 * 9,600) = 104.16666666666
		// UARTFBRD[DIVFRAC] = integer(0.166667 * 64 + 0.5) = 11


		// 1. Disable the UART by clearing the UARTEN bit in the UARTCTL register.
		UART0->CTL &= ~(1<<0);

		// 2. Write the integer portion of the BRD to the UARTIBRD register.
		UART0->IBRD = 104;

		// 3. Write the fractional portion of the BRD to the UARTFBRD register.
		UART0->FBRD = 11;

		// 4. Write the desired serial parameters to the UARTLCRH register (in this case, a value of
		// 	   0x0000.0060).
		UART0->LCRH = (0x3<<5);

		// 5. Configure the UART clock source by writing to the UARTCC register.
		UART0->CC = 0x0;

		// 6. Optionally, configure the µDMA channel (see “Micro Direct Memory Access (μDMA)” on page 547)
		//     and enable the DMA option(s) in the UARTDMACTL register.

		// 7. Enable the UART by setting the UARTEN bit in the UARTCTL register
		UART0->CTL  = (1<<0)|(1<<8)|(1<<9);
	}
	void uart_debug_print(char* str){
		while(*str){
			uart_debug_print_char(*(str++));
		}
	}

	void uart_debug_print_char(char c){
		while((UART0->FR & (1<<5)) != 0);
	  	UART0->DR = c;
	}

	char uart_debug_reveive_char(void){
		char c;
		while((UART0->FR & (1<<4))!=0);
		c = UART0->DR;
		return c;
	}
#else
	void uart_debug_init(void){}
	void uart_debug_print(char* str){}
	void uart_debug_print_char(char c){}
	char uart_debug_reveive_char(void){}
#endif // ! __CENO_RTOS_UART_DEBUG_ON__
