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

#ifndef __CENO_RTOS_RING_BUF_H__
#define __CENO_RTOS_RING_BUF_H__

typedef struct os_ring_buffer{
	uint8_t *buffer;

}os_ring_buffer_t;


os_err_t os_ring_buffer_init(os_ring_buffer_t* buffer);

os_err_t os_ring_buffer_push(os_ring_buffer_t* buffer);

uint8_t os_ring_buffer_pop(os_ring_buffer_t* buffer);

uint8_t os_ring_buffer_is_full(os_ring_buffer_t* buffer);

uint8_t os_ring_buffer_is_empty(os_ring_buffer_t* buffer);


#endif // ! __CENO_RTOS_RING_BUF_H__

