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
#include "../include/os.h"
#include "../include/os_thread.h"
#include "../include/os_mutex.h"


void OSMutex_create(OSMutex *mutex){
    if(mutex == NULL){
        /* bad mutex pointer */
    }else{
        mutex->owner = NULL;
        mutex->count = 0;
        mutex->suspQ = NULL;
    }
}
void OSMutex_delete(OSMutex *mutex){
     if(mutex == NULL){
        /* bad mutex pointer */
    }else{
       
    }
}
void OSMutex_acquire(OSMutex *mutex,uint32_t timeout){

}
void OSMutex_release(OSMutex *mutex){

}