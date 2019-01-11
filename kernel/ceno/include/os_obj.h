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

#ifndef __CENO_RTOS_OBJ_H__
#define __CENO_RTOS_OBJ_H__

typedef enum obj_type{
	OS_OBJ_TYPE_NONE = 0,
	OS_OBJ_TASK_TYPE,
	OS_OBJ_SEM_TYPE,
	OS_OBJ_MUTEX_TYPE,
	OS_OBJ_QUEUE_TYPE,
	OS_OBJ_BUFFER_TYPE,
}obj_type_t;

typedef struct os_obj{
	os_list_t list;
	const cpu_char_t* name;
	obj_type_t objType;
}os_obj_t;

typedef struct os_obj_list{
	os_list_t taskHead;

	#ifdef __CENO_RTOS_CONFIG_MUTEX_ON__
		os_list_t mutexHead;
	#endif
	
	#ifdef __CENO_RTOS_CONFIG_SEM_ON__
		os_list_t semHead;
	#endif

	#ifdef __CENO_RTOS_CONFIG_QUEUE_ON__
		os_list_t queueHead;
	#endif

	#ifdef __CENO_RTOS_CONFIG_RING_BUFFER_ON__
		os_list_t bufferHead;
	#endif
}os_obj_list_t;


os_err_t os_obj_container_init(void);

#endif // !__CENO_RTOS_OBJ_H__
