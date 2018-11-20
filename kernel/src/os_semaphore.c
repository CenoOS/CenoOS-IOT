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


void OSBinarySemaphore_create(OSBinarySemaphore* binSem){
   
   /* safe check */

    __disable_irq();   /* into critial area */

    binSem->count = 1;

    __enable_irq(); /* out critial area */
}