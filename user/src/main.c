#include "bsp.h"
#include "os_api.h"

os_task_t task_01;
uint32_t stack_task_01[40];
void task_01_thread(){
  while(1){
    uart_debug_print("[task] task 1 \n\r");
  }
}

os_task_t task_02;
uint32_t stack_task_02[40];
void task_02_thread(){
  while(1){
    uart_debug_print("[task] task 2 \n\r");
  }
}

int main(void)
{

  bsp_init();

  uart_debug_print("[debug] _______________begin______________\n\r");
  uart_debug_print("[main] main start.\n\r");

  os_init();

  os_err_t task_01_err = os_task_create(
    &task_01,
    "task_01",
    5,
    &stack_task_01,
    sizeof(stack_task_01),
    &task_01_thread
  );

  os_err_t task_02_err = os_task_create(
    &task_02,
    "task_02",
    4,
    &stack_task_02,
    sizeof(stack_task_02),
    &task_02_thread
  );
  
  os_run();
}


