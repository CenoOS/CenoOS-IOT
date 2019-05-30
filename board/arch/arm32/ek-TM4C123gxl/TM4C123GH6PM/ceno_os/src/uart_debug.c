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
		__asm	(
			"CPSID	I\n\t"
		);
		while(*str){
			uart_debug_print_char(*(str++));
		}
		__asm	(
			"CPSIE	I\n\t"
		);
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

	void uart_debug_print_number(unsigned int v,unsigned int zero){
		if(v == 0){
			if(zero == 1){
				uart_debug_print_char('0');
			}
		}
		if(v == 1){
			uart_debug_print_char('1');
		}
		if(v == 2){
			uart_debug_print_char('2');
		}
		if(v == 3){
			uart_debug_print_char('3');
		}
		if(v == 4){
			uart_debug_print_char('4');
		}
		if(v == 5){
			uart_debug_print_char('5');
		}
		if(v == 6){
			uart_debug_print_char('6');
		}
		if(v == 7){
			uart_debug_print_char('7');
		}
		if(v == 8){
			uart_debug_print_char('8');
		}
		if(v == 9){
			uart_debug_print_char('9');
		}
		if(v == 10){
			uart_debug_print_char('a');
		}
		if(v == 11){
			uart_debug_print_char('b');
		}
		if(v == 12){
			uart_debug_print_char('c');
		}
		if(v == 13){
			uart_debug_print_char('d');
		}
		if(v == 15){
			uart_debug_print_char('e');
		}
		if(v == 15){
			uart_debug_print_char('f');
		}	
	}

	void uart_debug_print_i32(unsigned int v,unsigned int mode){
		if(mode == 16){
			uart_debug_print_char('0');
			uart_debug_print_char('x');
			for(int i = 0; i<8; i++){
				unsigned int hex = ((v >> ((7-i)*4)) & 0xF);
				uart_debug_print_number(hex,1);
			}
		}else if(mode == 10){
			volatile unsigned int MAX = 1000000000; //max 4294967296                 
			unsigned int zero = 0;
			while(MAX != 1){
				unsigned int oct = v / MAX;
				if(oct > 0){
					zero = 1;
				}
				if(zero==0){
					uart_debug_print_number(oct,0);
				}else{
					uart_debug_print_number(oct,1);
				}
				
				if(v >= MAX){
					v = v - oct*MAX;
				}
				MAX = MAX / 10;
			}
			uart_debug_print_number(v,1);
		}
	}
	
	void uart_debug_print_os_register(){
		 __asm(
			"MOV	r0, r15\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, #10\n\t"
			"BL	uart_debug_print_char\n\t"

			"MOV	r0, pc\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, lr\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r12\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r3\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r2\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r0\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r11\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r10\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r9\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r8\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r7\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r6\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r5\n\t"
			"BL	uart_debug_print_i32\n\t"

			"MOV	r0, r4\n\t"
			"BL	uart_debug_print_i32\n\t"
		 );
	}
#else
	void uart_debug_init(void){}
	void uart_debug_print(char* str){}
	void uart_debug_print_char(char c){}
	char uart_debug_reveive_char(void){}
#endif // ! __CENO_RTOS_UART_DEBUG_ON__
