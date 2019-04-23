#include "../include/os_api.h"
#include <malloc.h>

os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size){
	uart_debug_print("[queue] queue create : ");
	uart_debug_print(name);
	uart_debug_print("\n\r");
	if(size==0U){
		return OS_ERR;
	}

	os_obj_t obj;
	obj.name = name;
	obj.objType = OS_OBJ_QUEUE_TYPE;

	me->obj = obj;
	me->size  = size;


	
}

os_err_t os_queue_add_item(os_queue_t* queue, void* itemPtr){
	queue->elems = itemPtr;
}

os_err_t os_queue_remove(){

}

os_err_t os_queue_clear(){

}

uint32_t os_queue_size(os_queue_t* queue){
	return 0U;
}