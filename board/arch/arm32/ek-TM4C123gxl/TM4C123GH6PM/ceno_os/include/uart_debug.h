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

#ifndef __CENO_RTOS_UART_DEBUG__
#define __CENO_RTOS_UART_DEBUG__

void uart_debug_init(void);

void uart_debug_print(char* str);

void uart_debug_print_char(char c);

void uart_debug_print_i32(unsigned int v,unsigned int mode);

char uart_debug_reveive_char(void);

void uart_debug_print_os_register();

#endif //! __CENO_RTOS_UART_DEBUG__
