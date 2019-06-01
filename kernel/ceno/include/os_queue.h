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
	uint32_t front;
	uint32_t rear;

	uint32_t* elems;
}os_queue_t;


os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size);

os_err_t os_queue_item_en(os_queue_t* queue, uint32_t* itemPtr);
os_err_t os_queue_item_de(os_queue_t* queue, uint32_t* itemPtr);

os_err_t os_queue_clear(os_queue_t* queue);

uint32_t os_queue_length(os_queue_t* queue);

uint32_t os_queue_is_empty(os_queue_t* queue);
uint32_t os_queue_is_full(os_queue_t* queue);

uint32_t os_queue_traverse(os_queue_t* queue);




#endif // !__CENO_RTOS_QUEUE_H__