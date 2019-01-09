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
#include "../include/os_api.h"

#define DEFAULT_BLOCK_QUEUE_SIZE 10


os_err_t os_sem_create(os_semphore_t* sem, const cpu_char_t *name, sem_count_t count){
	
	if(count == 0U){ // count must bigger than 0
		return OS_ERR;
	}

	if(name == (void*)0){ // is name null?
		return OS_ERR;
	}

	os_obj_t obj;
	obj.objType =  OS_OBJ_SEM_TYPE;
	obj.name = name;
	
	sem->obj = obj;
	sem->count = count;

	return os_queue_create(&sem->blockTasks, name, (uint32_t)DEFAULT_BLOCK_QUEUE_SIZE);
}

os_err_t os_sem_del(os_semphore_t* sem){
	__DISABLE_IRQ();

	__ENABLE_IRQ();
}

os_err_t os_sem_give(os_semphore_t* sem){
	__DISABLE_IRQ();

	__ENABLE_IRQ();
}

os_err_t os_sem_take(os_semphore_t* sem, tick_t ticks){
	__DISABLE_IRQ();

	__ENABLE_IRQ();
}

os_err_t os_sem_count_get(os_semphore_t* sem, sem_count_t* count){
	count = &sem->count;
}

os_err_t os_sem_count_set(os_semphore_t* sem, sem_count_t count){
	__DISABLE_IRQ();
	sem->count = count;
	__ENABLE_IRQ();
	
}