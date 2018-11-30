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
#ifndef __CENO_RTOS_MUTEX_H__
#define __CENO_RTOS_MUTEX_H__

typedef struct{
    OSThread * suspQ;
    OSThread * owner;
    uint8_t    count;
}OSMutex;

void OSMutex_create(OSMutex *mutex);
void OSMutex_delete(OSMutex *mutex);

void OSMutex_acquire(OSMutex *mutex,uint32_t timeout);

void OSMutex_release(OSMutex *mutex);

#endif // __CENO_RTOS_MUTEX_H__