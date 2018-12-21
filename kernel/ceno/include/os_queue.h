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

#ifndef __CENO_RTOS_QUEUE_H__
#define __CENO_RTOS_QUEUE_H__

typedef struct os_queue{
	os_obj_t obj;

	uint32_t size;
	uint32_t start;
	uint32_t end;

	uint32_t front;
	uint32_t rear;

	void* elems;
	void* ext; // you can write a message queue based on it
}os_queue_t;

typedef struct os_msg{
	os_queue_t msgQ;
}os_msg_t;


os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size);

os_err_t os_queue_add_item(os_queue_t* queue, void* itemPtr);

os_err_t os_queue_remove();

os_err_t os_queue_clear();

#endif // !__CENO_RTOS_QUEUE_H__