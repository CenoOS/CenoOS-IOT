/**
 *	Ceno RTOS mutex 
 * 	
 * 2018-12-17 
 * neroyang
 * 
 * Copyright (C) 2018 CenoCloud. All Rights Reserved 
 *
 * Contract Information：
 * nerosoft@outlook.com
 * https://www.cenocloud.com
 */


#ifndef __CENO_RTOS_MUTEX_H__
#define __CENO_RTOS_MUTEX_H__

typedef struct os_mutex{
	os_obj_t obj;
	os_task_t *mutexTask;
	struct os_mutex *mutexList;
	
}os_mutex_t;

os_err_t os_mutex_create(os_mutex_t mutex, cpu_char_t cpu);

#endif //! __CENO_RTOS_MUTEX_H__