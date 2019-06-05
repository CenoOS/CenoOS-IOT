/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2018-12-19
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#ifndef __CENO_RTOS_SEMPHORE_H__
#define __CENO_RTOS_SEMPHORE_H__

typedef struct os_semphore{
	os_obj_t obj;
	sem_count_t count;
	sem_count_t peakCount;
	os_queue_t blockTasks;
	os_list_t semList; 
}os_semphore_t;



os_err_t os_sem_create(os_semphore_t* sem, const cpu_char_t *name, sem_count_t count);

os_err_t os_sem_del(os_semphore_t* sem);

os_err_t os_sem_give(os_semphore_t* sem);

os_err_t os_sem_take(os_semphore_t* sem,  tick_t ticks);

os_err_t os_sem_count_get(os_semphore_t* sem, sem_count_t* count);

os_err_t os_sem_count_set(os_semphore_t* sem, sem_count_t count);

#endif // ! __CENO_RTOS_SEMPHORE_H__


#