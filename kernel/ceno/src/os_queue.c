#include "../include/os.h"
#include "../include/os_queue.h"

os_err_t os_queue_create(os_queue_t* me, uint32_t size){

	me->size = size;
	me->start = 0;
	me->end = 0;

	me->elems = (void*)calloc(me->size,sizeof(void*));
}

os_err_t os__create(os_queue_t* me,const cpu_char_t* name, uint32_t size){
	if(size==0U){
		return OS_ERR;
	}
}

os_err_t os_queue_remove(){

}

os_err_t os_queue_clear(){

}