/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2018-11-20
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#include <stdint.h>
#include "../include/os_semaphore.h"


void OSBinarySemaphore_create(OSBinarySemaphore* binSem,BINARY_SEMAPHORE_STATE state){
   
    /* safe check */

    __disable_irq();   /* into critial area */

    binSem->count = state;

    __enable_irq(); /* out critial area */
}

void OSBinarySemaphore_delete(OSBinarySemaphore *binSem){
    
}

void OSBinarySemaphore_acquire(OSBinarySemaphore* binSem,uint32_t timeout){
    while(binSem->count==NOT_AVIALIABLE){} /*愚蠢的阻塞,能不能通过降低线程优先级搞定.*/
    binSem->count = NOT_AVIALIABLE;
}

void OSBinarySemaphore_release(OSBinarySemaphore* binSem){
    binSem->count = AVIALIABLE;
}



void OSSemaphore_create(OSSemaphore *sem, uint8_t initial_count){

}

void OSSemaphore_delete(OSSemaphore *sem){

}

void OSSemaphore_acquire(OSSemaphore *sem,uint32_t timeout){

}

void OSSemaphore_release(OSSemaphore *sem){

}

