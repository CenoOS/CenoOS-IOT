#include "../include/os_api.h"

os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size){
	uart_debug_print("[queue] queue create : ");
	uart_debug_print(name);
	uart_debug_print("\n\r");
	if(size==0U){
		return OS_ERR;
	}

	me->elems = (uint32_t*)os_heap_malloc(size*sizeof(uint32_t));
	if(!me->elems){
		uart_debug_print("[queue] queue create : heap malloc failed!\n\r");
		return OS_ERR;
	}
	os_obj_t obj;
	obj.name = name;
	obj.objType = OS_OBJ_QUEUE_TYPE;
	me->obj = obj;
	me->front = 0;
	me->rear = 0;
	me->size  = size;
	
	return OS_ERR_NONE;
}

os_err_t os_queue_item_en(os_queue_t* queue, uint32_t* itemPtr){
	if(os_queue_is_full(queue)==TRUE){
		uart_debug_print("[queue] queue en : queue is full!\n\r");
		return OS_ERR;	
	}

	queue->elems[queue->rear] = itemPtr;
	queue->rear = (queue->rear + 1) % queue->size;

	return OS_ERR_NONE;
}

os_err_t os_queue_item_de(os_queue_t* queue, uint32_t* itemPtr){
	if(os_queue_is_empty(queue) == TRUE){
		uart_debug_print("[queue] queue de : queue is empty!\n\r");
		return OS_ERR;	
	}
	*itemPtr = queue->elems[queue->front];
	queue->front = (queue->front + 1) % queue->size;

	return OS_ERR_NONE;
}

uint32_t os_queue_traverse(os_queue_t* queue){
	uint32_t i = queue->front;
	uart_debug_print("[queue] queue traverse \n\r");
	while( i != queue->rear){
		uart_debug_print(" |--[queue] item : '");
		uart_debug_print_i32(queue->elems[i],16);
		uart_debug_print("'\n\r");
		i = (i+1) % queue->size;
	}
}

uint32_t os_queue_length(os_queue_t* queue){
	return (queue->rear - queue->front + queue->size) % queue->size;
}

uint32_t os_queue_is_empty(os_queue_t* queue){
	if(queue->front = queue->rear){
		return TRUE;
	}
	return FALSE;
}

uint32_t os_queue_is_full(os_queue_t* queue){
	if((queue->rear+1) % queue->size == queue->front){
		return TRUE;
	}
	return FALSE;
}