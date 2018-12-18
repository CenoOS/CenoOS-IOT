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

#ifndef __CENO_RTOS_LIST_H__
#define __CENO_RTOS_LIST_H__

typedef struct os_list{
	struct os_list* next;
	struct os_list* prev;
}os_list_t;

os_err_t os_list_init(os_list_t* listHead);

uint8_t is_list_empty(os_list_t*list);

os_err_t os_list_insert(os_list_t* head, os_list_t* elem);

os_err_t os_list_add(os_list_t* head, os_list_t* elem);

os_err_t os_list_rm(os_list_t* elem);

os_err_t os_list_rm_init(os_list_t* elem);

#endif // !__CENO_RTOS_LIST_H__