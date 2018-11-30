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


typedef enum BINARY_SEMAPHORE_STATE{
    AVIALIABLE = 0x01,
    NOT_AVIALIABLE = 0x00
} BINARY_SEMAPHORE_STATE;

typedef struct{
    OSThread* suspQ;
    uint32_t count;
} OSSemaphore;


typedef OSSemaphore OSBinarySemaphore;

void OSBinarySemaphore_create(OSBinarySemaphore *binSem,BINARY_SEMAPHORE_STATE state);
void OSBinarySemaphore_delete(OSBinarySemaphore *binSem);
void OSBinarySemaphore_acquire(OSBinarySemaphore *binSem,uint32_t timeout);
void OSBinarySemaphore_release(OSBinarySemaphore *binSem);

void OSSemaphore_create(OSSemaphore *sem, uint8_t initial_count);
void OSSemaphore_delete(OSSemaphore *sem);
void OSSemaphore_acquire(OSSemaphore *sem,uint32_t timeout);
void OSSemaphore_release(OSSemaphore *sem);

#endif // __CENO_RTOS_SEMAPHORE_H__