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

void uart_debug_init(void){
	SYSCTL->RCGCUART |= (1<<0);
	SYSCTL->RCGCGPIO |= (1<<0);

	GPIOA->AFSEL      = (1<<1)|(1<<0);
	GPIOA->PCTL       = (1<<0)|(1<<4);
	GPIOA->DEN   	  = (1<<0)|(1<<1);
	 
	UART0->CTL       &= ~(1<<0);
	UART0->IBRD       = 104;
	UART0->FBRD       = 11;
	UART0->LCRH       = (0x3<<5);
	UART0->CC         = 0x0;

	UART0->CTL        = (1<<0)|(1<<8)|(1<<9);
}

void uart_debug_print(char* str){
	while(*str){
		uart_debug_print_char(*(str++));
	}
}

void uart_debug_print_char(char c){
	while((UART0->FR & (1<<5))!=0);
	UART0->DR = c;
}

char uart_debug_reveive_char(void){
	char c;
	while((UART0->FR & (1<<4))!=0);
	c = UART0->DR;
	return c;
}

