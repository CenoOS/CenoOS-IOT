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

typedef	unsigned int os_state_t;
#define OS_STATE_DORMANT 		1;
#define OS_STATE_READY 			2;
#define OS_STATE_RUNNING 		1;
#define OS_STATE_PENDING 		4;
#define OS_STATE_INTERRUPTED 	4;


typedef	unsigned int os_err_t;
#define OS_ERR 		1
#define OS_ERR_NONE 0


typedef void* cpu_stk_t;
typedef unsigned int cpu_stk_size_t;
typedef char cpu_char_t;

typedef unsigned int priority_t;


typedef unsigned int queue_size_t;

#endif //! __CENO_RTOS_OS_H__