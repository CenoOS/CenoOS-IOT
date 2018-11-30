/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2018-11-29
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#ifndef __CENO_RTOS_MQ_H__
#define __CENO_RTOS_MQ_H__


typedef struct{
    OSThread * sendSuspQ;
    OSThread * receiveSuspQ;

    uint8_t * buff_ptr;         /* pointer to queue data area */
    uint32_t unit_size;         /* size of exch message */
    uint32_t max_num_msgs;      /* max number of storable messages */
    uint32_t insert_index;      /* next byte index to insert into */
    uint32_t remove_index;      /* next byte index messages remove from */
    uint32_t num_msgs_stored;   /* number of message stored */
} OSMQ;

void OSMQ_create(OSMQ *mqPtr,uint8_t *buffer_ptr, uint32_t unit_size, uint32_t max_num_msgs);

void OSMQ_delete(OSMQ *mqPtr);

void OSMQ_send(OSMQ *mqPtr, uint32_t timeout, uint8_t *msgPtr);

void OSMQ_recive(OSMQ *mqPtr, uint32_t timeout, uint8_t *msgPtr);

void OSMQ_flush(OSMQ *mqPtr);

#endif // __CENO_RTOS_MQ_H__