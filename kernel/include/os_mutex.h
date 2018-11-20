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

void OSMutex_create();

void OSMutex_acquire();

void OSMutex_release();

#endif // __CENO_RTOS_MUTEX_H__