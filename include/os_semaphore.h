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


#ifndef __CENO_RTOS_SEMAPHORE_H__
#define __CENO_RTOS_SEMAPHORE_H__

typedef struct{
    uint32_t count;
} OSSemaphore;

typedef OSSemaphore OSBinarySemaphore;

void OSBinarySemaphore_create(OSBinarySemaphore* binSem);

void OSSemaphore_create();

#endif // __CENO_RTOS_SEMAPHORE_H__