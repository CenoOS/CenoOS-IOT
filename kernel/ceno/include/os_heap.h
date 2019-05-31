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


//stack pointer
extern uint32_t _stack_ptr;
//.text/code,stored in Flash
extern uint32_t _etext;
//.data,copied into RAM on boot
extern uint32_t _data;
extern uint32_t _edata;
//.bss,unitialized variables
extern uint32_t _bss;
extern uint32_t _ebss;

typedef struct os_heap_block os_heap_block_t;
struct os_heap_block{
	os_size_t size;
	os_heap_block_t* next;
	os_heap_block_t* prior;
};


os_err_t os_heap_init();
os_heap_block_t* os_heap_find_block(os_size_t size);
void* os_heap_malloc(os_size_t size);
void* os_heap_realloc (void* ptr, os_size_t newSize);
uint32_t os_heap_free(void* ptr);

void* os_heap_calloc (os_size_t num, os_size_t size);





#endif //! __CENO_RTOS_OS_MM_HEAP_H__