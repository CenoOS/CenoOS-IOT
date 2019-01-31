#include <stdint.h>
#include "bsp.h"
#include "uart_debug.h"
#include "os_api.h"


os_task_t* task_01;
uint32_t stack_task_01[40];
void task_01_thread(){
  
  uart_debug_print("test uart debug");

  light_green_on();
  delay_block(1000);
  light_green_off();
  delay_block(1000);
}

int main(void)
{
  bsp_init();

  os_err_t task_01_err = os_task_create(
    task_01,
    "task_01",
    5,
    stack_task_01,
    sizeof(stack_task_01),
    task_01
  );

  os_run();
}


