#include "../include/os_api.h"

os_err_t os_list_init(os_list_t* head){
	head->next  = head;
	head->prev = head;
}

uint8_t is_list_empty(os_list_t*list){
	return (list->next==list);
}

os_err_t os_list_insert(os_list_t* head, os_list_t* elem){
	elem->prev = head->prev;
	elem->next = head;

	head->prev->next = elem;
	head->prev= elem;
}

os_err_t os_list_add(os_list_t* head, os_list_t* elem){
	elem->prev = head;
	elem->next = head->next;

	head->next->prev = elem;
	head->next = elem;
}

os_err_t os_list_rm(os_list_t* elem){
	elem->prev->next = elem->next;
	elem->next->prev = elem->prev;
}

os_err_t os_list_rm_init(os_list_t* elem){
	elem->prev->next = elem->next;
	elem->next->prev = elem->prev;

	elem->next = elem->prev = elem;
}