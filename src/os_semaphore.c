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


void OSBinarySemaphore_create(OSBinarySemaphore* binSem,BINARY_SEMAPHORE_STATE state){
   
    /* safe check */

    __disable_irq();   /* into critial area */

    binSem->count = state;

    __enable_irq(); /* out critial area */
}


void OSBinarySemaphore_acquire(OSBinarySemaphore* binSem){
    while(binSem->count==NOT_AVIALIABLE){

    }
    binSem->count = NOT_AVIALIABLE;
}

void OSBinarySemaphore_release(OSBinarySemaphore* binSem){
    binSem->count = AVIALIABLE;
}

/*
第一局(机要局)负责密码通讯及相关管理
第二局(国际情报局)负责国际战略情报搜集
第三局(政经情报局)负责各国政经科技情报搜集
第四局(台港澳局)负责该地区情报工作
第五局(情报分析通报局)负责情报分析通报、搜集情报指导
第六局(业务指导局)负责对所辖各省级厅局的业务指导
第七局(反间谍情报局)负责反间谍情报搜集
第八局(反间谍侦察局)负责外国间谍的跟监、侦查、逮捕等
第九局(对内保防侦察局)负责涉外单位防谍，监控境内反动组织及外国机构
第十局(对外保防侦察局)负责驻外机构人员及留学生监控，侦查境外反动组织活动
第十一局(情报资料中心局)负责文书情报资料的搜集和管理
第十二局(社会调查局)负责民意调查及一般性社会调查
第十三局(技侦科技局)负责侦技科技器材的管理、研发
第十四局(技术侦察局)负责邮件检查与电信侦控
第十五局(综合情报分析局)负责综合情报的分析、研判
第十六局(影像情报局)负责各国政、经、军等影像情报

17局为企业局，主管该部所属企业、公司等事业单位。
*/
