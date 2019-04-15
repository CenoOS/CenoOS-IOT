/***************************************************
 *	Ceno RTOS task 
 * 	
 * 2018-12-17 
 * neroyang
 * 
 * Copyright (C) 2018 CenoCloud. All Rights Reserved 
 *
 * Contract Information：
 * nerosoft@outlook.com
 * https://www.cenocloud.com
 ****************************************************/


#ifndef __CENO_RTOS_KERNEL_H__
#define __CENO_RTOS_KERNEL_H__

os_err_t os_init(void);

os_err_t os_run(void);

os_err_t os_idle(void);

os_err_t os_tick(void);

os_err_t os_sched(void);


extern os_task_t* volatile osIdleTask;

#endif