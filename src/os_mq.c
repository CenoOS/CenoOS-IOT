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
#include "../include/os_mq.h"
#include "../include/os_thread.h"
#include <stdint.h>


static uint8_t queue_remove (OSMQ *mqPtr, uint8_t* msgPtr);
static uint8_t queue_insert (OSMQ *mqPtr, uint8_t* msgPtr);

static void OSMQTimerCallback ();



void OSMQ_create(OSMQ *mqPtr,uint8_t *buffer_ptr, uint32_t unit_size, uint32_t max_num_msgs){
    if((mqPtr==NULL)||(buffer_ptr==NULL)){
        /* bad pointer */
    }else if((unit_size==0)||(max_num_msgs==0)){
        /* bad value */
    }else{
        mqPtr->buff_ptr = buffer_ptr;
        mqPtr->unit_size = unit_size;
        mqPtr->max_num_msgs = max_num_msgs;

        mqPtr->sendSuspQ = NULL;
        mqPtr->receiveSuspQ = NULL;

        mqPtr->insert_index = 0;
        mqPtr->remove_index = 0;
        mqPtr->num_msgs_stored = 0;
    }
}

void OSMQ_delete(OSMQ *mqPtr){

}

void OSMQ_send(OSMQ *mqPtr, uint32_t timeout, uint8_t *msgPtr){

}

void OSMQ_recive(OSMQ *mqPtr, uint32_t timeout, uint8_t *msgPtr){

}

void OSMQ_flush(OSMQ *mqPtr){

}



static uint8_t queue_remove (OSMQ *mqPtr, uint8_t* msgPtr){
    uint8_t status;
    OSThread *tcbPtr;
    
    if((mqPtr==NULL)||(msgPtr==NULL)){
        /* bad pointer */
    }else{
        /* copy in */
        memcpy(msgPtr,(mqPtr->buff_ptr+mqPtr->remove_index),mqPtr->unit_size);
        mqPtr->remove_index+=msgPtr->unit_size;
        mqPtr->num_msgs_stored--;

        /* circle */
        if(mqPtr->remove_index >= (mqPtr->unit_size * mqPtr->max_num_msgs)){
            mqPtr->remove_index = 0;
        }

        /* get header of suspend thread in queue */


    }

}


static uint8_t queue_insert (OSMQ *mqPtr, uint8_t* msgPtr){
    uint8_t status;
    OSThread *tcbPtr;
    
    if((mqPtr==NULL)||(msgPtr==NULL)){
        /* bad pointer */
    }else{
        /* copy in */
        memcpy((mqPtr->buff_ptr+mqPtr->insert_index),msgPtr,mqPtr->unit_size);
        mqPtr->insert_index+=msgPtr->unit_size;
        mqPtr->num_msgs_stored++;

        /* circle */
        if(mqPtr->insert_index >= (mqPtr->unit_size * mqPtr->max_num_msgs)){
            mqPtr->insert_index = 0;
        }

        /* get header of suspend thread in queue */


    }

}