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


#define	HEAP_SIZE	2048 // 2048 byte heap
static char *HEAP_START_ADDR;

os_heap_block_t* lastHeapBlock;

uint32_t os_heap_is_free(os_heap_block_t* block){
	return ((0x1 & block->meta) << 30) & 0xFFFFFFFF;
}

uint32_t os_heap_size(os_heap_block_t* block){
	return (block->meta >> 1) & 0xFFFFFFFF;
}

char *sbrk(os_size_t incr){
   	char *prevHeapEnd;
   	if (HEAP_START_ADDR == NULL){
     	HEAP_START_ADDR = &_ebss;
	}
   	prevHeapEnd = HEAP_START_ADDR;

   	if (HEAP_START_ADDR + incr > &_stack_ptr)
	{
    	/* out of memory errors  */
    	uart_debug_print("[heap] _sbrk: Heap and stack collision\n\r");
    }
   	HEAP_START_ADDR += incr;
 	return prevHeapEnd;
}

os_err_t os_heap_init(){
	HEAP_START_ADDR = &_ebss;
	uart_debug_print("[heap] heap initial at: '0x");
	uart_debug_print_i32((unsigned int)HEAP_START_ADDR);
}




os_heap_block_t* os_heap_find_block(os_heap_block_t* last, os_size_t size){
	// os_heap_block_t* block = &osHeapBlockHead;
	// while(block && (block->free && block->size >= size)){
	// 	*last = block;
	// }
	// return block;
}

os_heap_block_t* os_heap_extend(os_heap_block_t* last, os_size_t size){

}

inline os_size_t align8(os_size_t size) {
    return (((size-1) >> 3) << 3) + 8;
}

void os_heap_split_block(os_heap_block_t* block, os_size_t size){
	// os_heap_block_t* newBlock;
	// newBlock = block->data + size;
	// newBlock->size = block->size - size - sizeof(os_heap_block_t);
	// newBlock->next = block->next;
	// newBlock->free = 1;
	// block->next = newBlock;
}

// void *firstBlock = NULL;
void* os_heap_malloc(os_size_t size){
	// os_heap_block_t* block, last;
	// os_size_t s  = align8(size);
	// if(firstBlock){
	// 	last = firstBlock;
	// 	block = os_heap_find_block(last,s);
	// 	if(block){
	// 		if(block->size - s >= sizeof(os_heap_block_t)+8){
	// 			os_heap_split_block(block,s);
	// 		}
	// 		block->free = 0;
	// 	}else{
	// 		block = os_heap_extend(last,s);
	// 		if(!block){
	// 			return NULL;
	// 		}
	// 	}
	// }else{
	// 	block = os_heap_extend(NULL,s);
	// 	if(!block){
	// 		return NULL;
	// 	}
	// 	firstBlock = block;
	// }
	// return block->data;
}

void* os_heap_calloc (os_size_t num, os_size_t size){

}

void* os_heap_realloc (void* ptr, os_size_t newSize){

}

uint32_t os_heap_free(void* ptr){

}
