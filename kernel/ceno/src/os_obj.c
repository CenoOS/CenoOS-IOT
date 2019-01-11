/**
 *	Ceno RTOS task 
 * 	
 * 2019-1-11 
 * neroyang
 * 
 * Copyright (C) 2018 CenoCloud. All Rights Reserved 
 *
 * Contract Information：
 * nerosoft@outlook.com
 * https://www.cenocloud.com
 */
#include "../include/os_api.h"


/**
 * objects container
 **/
os_obj_list_t objs_container;

os_err_t os_obj_container_init(){
	/* init objects container */
	os_list_t taskList;
	os_err_t isListInit = os_list_init(&taskList);
	if(isListInit==OS_ERR){
		return isListInit;
	}

	objs_container.taskHead = taskList;
}