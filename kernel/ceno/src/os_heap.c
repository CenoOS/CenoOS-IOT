/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2019-01-29 
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/
#include "../include/os_api.h"


#define	KERNEL_HEAP_SIZE	2048 // 2048 byte heap
#define USER_HEAP_MAX_SIZE 2048 // user heap limit 

#define ALIGNMENT 8
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~0x7)
#define OS_SIZE_T_SIZE (ALIGN(sizeof(os_size_t)))
#define BLOCK_META_SIZE	ALIGN(sizeof(os_heap_block_t))

static char *HEAP_START_ADDR;

void *memcpy(void *dest, const void *src, os_size_t count);

char *sbrk(os_size_t incr){
	char *prevHeapEnd;
	if (HEAP_START_ADDR == NULL){
		HEAP_START_ADDR = &_ebss;
	}
	prevHeapEnd = HEAP_START_ADDR;

	if (HEAP_START_ADDR + incr > &_stack_ptr)
	{
		/* out of memory errors  */
		uart_debug_print("[heap] sbrk: Heap and stack collision\n\r");
	}
	HEAP_START_ADDR += incr;
	uart_debug_print("[heap] sbrk: expand '");
	uart_debug_print_i32(incr,10);
	uart_debug_print("' at '");
	uart_debug_print_i32(HEAP_START_ADDR,16);
	uart_debug_print("'\n\r");
	return prevHeapEnd;
}

os_err_t os_heap_init(){
	HEAP_START_ADDR = &_ebss;
	uart_debug_print("[heap] kernel heap: initial at '0x");
	uart_debug_print_i32((unsigned int)HEAP_START_ADDR,16);
	uart_debug_print("'\n\r");

	uart_debug_print("[heap] user heap: initial at '0x");
	uart_debug_print_i32((unsigned int)HEAP_START_ADDR + KERNEL_HEAP_SIZE,16);
	uart_debug_print("'\n\r");

	os_heap_block_t *block = sbrk(BLOCK_META_SIZE);
	block->size = BLOCK_META_SIZE;
	block->next = block;
	block->prior = block;

	uint32_t *a = os_heap_malloc(3*sizeof(uint32_t));
	a[0] = 1;
	a[1] = 2;
	a[2] = 3;
	os_heap_free(a);
	uint32_t *b = os_heap_malloc(2*sizeof(uint32_t));
	b[0] = 4;
	b[1] = 5;
	uint32_t *c = os_heap_malloc(10*sizeof(uint32_t));
	os_heap_free(c);
	uint32_t *d = os_heap_malloc(10*sizeof(uint32_t));
	os_heap_free(d);
	uint32_t *e = os_heap_malloc(10*sizeof(uint32_t));
	os_heap_block_t* blocks[11];
	for(int i = 0; i<10;i++){
		blocks[i] = os_heap_malloc(i*sizeof(uint32_t));
	}
	for(int i = 0; i<10;i++){
		os_heap_free(blocks[i]);
	}
	print_heap();
	
	return OS_ERR_NONE;
}



os_heap_block_t* os_heap_find_block(os_size_t size){
	os_heap_block_t *block;
	for(block = ((os_heap_block_t *)&_ebss)->next;
					block != &_ebss && (block->size < size);
					block = block->next);

	if(block != &_ebss){
		return block;
	}else{
		return NULL;
	}
}

void* os_heap_malloc(os_size_t size){
	os_size_t newSize = ALIGN(BLOCK_META_SIZE + size);
	os_heap_block_t *block = os_heap_find_block(newSize);

	if(block == NULL){
		block = sbrk(newSize);
		if((long)block == -1){
			return NULL;
		}else{
			block->size = newSize | 1;
		}
	}else{
		block->size |= 1;
		block->prior->next = block->next;
		block->next->prior = block->prior;
	}
	return (char *)block + BLOCK_META_SIZE; /* pointer to payload */
}

void* os_heap_realloc (void* ptr, os_size_t newSize){
	os_heap_block_t *block = ptr - BLOCK_META_SIZE;
	void *newPtr = os_heap_malloc(newSize);
	if(newPtr == NULL){
		return NULL;
	}
	uint32_t copySize = block->size + BLOCK_META_SIZE;
	if(newSize < copySize){
		copySize = newSize;
	}
	memcpy(newPtr, ptr, copySize);
	os_heap_free(ptr);
	return newPtr;
}

uint32_t os_heap_free(void* ptr){
	os_heap_block_t *block = ptr - BLOCK_META_SIZE,
						*head = &_ebss;
	block->size &= ~1;
	block->next = head->next;
	block->prior = head;
	head->next = block;
	block->next->prior = block;
}

void* os_heap_calloc (os_size_t num, os_size_t size){

}

void *memcpy(void *dest, const void *src, os_size_t count){
	if (dest == NULL || src == NULL)
	{
		return NULL;
	}
	char* pdest =(char*) dest;
	char* psrc = (char*)src;
	while (count--)
	{
		*pdest++ = *psrc++;
	}
	return dest;
}


void print_heap(){
	os_heap_block_t *block = &_ebss;
	while(block < (os_heap_block_t *)(&_ebss + KERNEL_HEAP_SIZE)){
		if(block->size & 1){
			uart_debug_print("[heap] alloced block: at '");
		}else{
			uart_debug_print("[heap] free block: at '");
		}
		uart_debug_print_i32(block,16);
		uart_debug_print("',size ");
		uart_debug_print_i32((os_heap_block_t *)(block->size & ~1),10);
		uart_debug_print("\n\r");

		block = (os_heap_block_t *)((char *)block + (block->size & ~1));
	}
}