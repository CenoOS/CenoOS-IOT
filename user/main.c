#include <stdint.h>
#include "../include/os_thread.h"
#include "../bsp/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/bsp.H"

#include "../include/os_semaphore.h"

/* define binary semaphore */
OSBinarySemaphore* binSem;

uint32_t stack_blinky1[40];
OSThread blinky1;
void main_blinky1() {
    while (1) {

        /* wait */
        OSBinarySemaphore_acquire(binSem);

        BSP_ledGreenOn();
        OS_delay(BSP_TICKS_PER_SEC / 4U);
        BSP_ledGreenOff();
        OS_delay(BSP_TICKS_PER_SEC * 3U / 4U);
    }
}

uint32_t stack_blinky2[40];
OSThread blinky2;
void main_blinky2() {
    while (1) {
        BSP_ledBlueOn();
        OS_delay(BSP_TICKS_PER_SEC / 2U);
        BSP_ledBlueOff();
        OS_delay(BSP_TICKS_PER_SEC / 3U);

        /* enable binsem */
        OSBinarySemaphore_release(binSem);
    }
}

uint32_t stack_blinky3[40];
OSThread blinky3;
void main_blinky3() {
    while (1) {
        BSP_ledRedOn();
        OS_delay(BSP_TICKS_PER_SEC / 2U);
        BSP_ledRedOff();
        OS_delay(BSP_TICKS_PER_SEC *3U / 5U);
    }
}

uint32_t stack_idleThread[40];
int main() {
    BSP_init();
    OS_init(&stack_idleThread,sizeof(stack_idleThread));

    /* create binary semaphore */
    OSBinarySemaphore_create(binSem,DISABLE);

    OSThread_start(&blinky1,
										5U,
                   &main_blinky1,
                   stack_blinky1, sizeof(stack_blinky1));

    OSThread_start(&blinky2,
										2U,
                   &main_blinky2,
                   stack_blinky2, sizeof(stack_blinky2));
	
    OSThread_start(&blinky3,
										3U,
                   &main_blinky3,
                   stack_blinky3, sizeof(stack_blinky3));

    OS_run();
    //return 0;
}



























/*LyoK56ys5LiA5bGAKOacuuimgeWxgCnotJ/otKPlr4bnoIHpgJrorq/lj4rnm7jlhbPnrqHnkIYK56ys5LqM5bGAKOWbvemZheaDheaKpeWxgCnotJ/otKPlm73pmYXmiJjnlaXmg4XmiqXmkJzpm4YK56ys5LiJ5bGAKOaUv+e7j+aDheaKpeWxgCnotJ/otKPlkITlm73mlL/nu4/np5HmioDmg4XmiqXmkJzpm4YK56ys5Zub5bGAKOWPsOa4r+a+s+WxgCnotJ/otKPor6XlnLDljLrmg4XmiqXlt6XkvZwK56ys5LqU5bGAKOaDheaKpeWIhuaekOmAmuaKpeWxgCnotJ/otKPmg4XmiqXliIbmnpDpgJrmiqXjgIHmkJzpm4bmg4XmiqXmjIflr7wK56ys5YWt5bGAKOS4muWKoeaMh+WvvOWxgCnotJ/otKPlr7nmiYDovpblkITnnIHnuqfljoXlsYDnmoTkuJrliqHmjIflr7wK56ys5LiD5bGAKOWPjemXtOiwjeaDheaKpeWxgCnotJ/otKPlj43pl7TosI3mg4XmiqXmkJzpm4YK56ys5YWr5bGAKOWPjemXtOiwjeS+puWvn+WxgCnotJ/otKPlpJblm73pl7TosI3nmoTot5/nm5HjgIHkvqbmn6XjgIHpgK7mjZXnrYkK56ys5Lmd5bGAKOWvueWGheS/nemYsuS+puWvn+WxgCnotJ/otKPmtonlpJbljZXkvY3pmLLosI3vvIznm5HmjqflooPlhoXlj43liqjnu4Tnu4flj4rlpJblm73mnLrmnoQK56ys5Y2B5bGAKOWvueWkluS/nemYsuS+puWvn+WxgCnotJ/otKPpqbvlpJbmnLrmnoTkurrlkZjlj4rnlZnlrabnlJ/nm5HmjqfvvIzkvqbmn6XlooPlpJblj43liqjnu4Tnu4fmtLvliqgK56ys5Y2B5LiA5bGAKOaDheaKpei1hOaWmeS4reW/g+WxgCnotJ/otKPmlofkuabmg4XmiqXotYTmlpnnmoTmkJzpm4blkoznrqHnkIYK56ys5Y2B5LqM5bGAKOekvuS8muiwg+afpeWxgCnotJ/otKPmsJHmhI/osIPmn6Xlj4rkuIDoiKzmgKfnpL7kvJrosIPmn6UK56ys5Y2B5LiJ5bGAKOaKgOS+puenkeaKgOWxgCnotJ/otKPkvqbmioDnp5HmioDlmajmnZDnmoTnrqHnkIbjgIHnoJTlj5EK56ys5Y2B5Zub5bGAKOaKgOacr+S+puWvn+WxgCnotJ/otKPpgq7ku7bmo4Dmn6XkuI7nlLXkv6HkvqbmjqcK56ys5Y2B5LqU5bGAKOe7vOWQiOaDheaKpeWIhuaekOWxgCnotJ/otKPnu7zlkIjmg4XmiqXnmoTliIbmnpDjgIHnoJTliKQK56ys5Y2B5YWt5bGAKOW9seWDj+aDheaKpeWxgCnotJ/otKPlkITlm73mlL/jgIHnu4/jgIHlhpvnrYnlvbHlg4/mg4XmiqUKCjE35bGA5Li65LyB5Lia5bGA77yM5Li7566h6K+l6YOo5omA5bGe5LyB5Lia44CB5YWs5Y+4562J5LqL5Lia5Y2V5L2N44CCCiov*/