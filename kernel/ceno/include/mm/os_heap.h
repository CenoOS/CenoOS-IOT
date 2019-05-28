/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2019-01-06 
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#ifndef __CENO_RTOS_OS_MM_HEAP_H__
#define __CENO_RTOS_OS_MM_HEAP_H__

os_err_t os_heap_init();

uint32_t os_heap_malloc();

uint32_t os_heap_alloc();

uint32_t os_heap_free();


#endif //! __CENO_RTOS_OS_MM_HEAP_H__