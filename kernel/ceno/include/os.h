/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2018-12-14 
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#ifndef __CENO_RTOS_OS_H__
#define __CENO_RTOS_OS_H__

typedef	unsigned int os_task_id_t;
typedef	unsigned int os_time_t;

typedef	enum os_err{
	OS_ERR 		=	1,
	OS_ERR_NONE =	0
}os_err_t;

typedef void* cpu_stk_t;
typedef unsigned int cpu_stk_size_t;
typedef char cpu_char_t;

typedef unsigned int priority_t;


typedef unsigned int queue_size_t;
#define MAX_QUEUE_SIZE 256


typedef unsigned int sem_count_t;

typedef unsigned int tick_t;

typedef long clock_t;

#endif //! __CENO_RTOS_OS_H__