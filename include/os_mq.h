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
    uint32_t count;
} OSMQ;

void OSMQ_create();

void OSMQ_post();

void OSMQ_accept();

#endif // __CENO_RTOS_MQ_H__