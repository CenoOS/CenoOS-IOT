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
	OS_OBJ_SEM_TYPE,
	OS_OBJ_MUTEX_TYPE,
	OS_OBJ_QUEUE_TYPE,
	OS_OBJ_BUFFER_TYPE,
}obj_type_t;

typedef struct os_obj{
	const cpu_char_t* name;
	obj_type_t objType;
}os_obj_t;

#endif // !__CENO_RTOS_OBJ_H__
