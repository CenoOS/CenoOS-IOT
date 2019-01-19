#include <stdint.h>
#include "bsp.h"
#include "os_api.h"

int main(void)
{

  system_init();
  bsp_init();

  while(1){
    light_green_on();
    delay_block(1000);
   
    light_green_off();
    delay_block(1000);
  }
}
