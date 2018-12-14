//---SYSTEM CONTROL REGISTERS---//
#define SYS_CTRL_RCGC2  (*((volatile unsigned long *)0x400FE108))   //offset of RCGC2 register is 0x108
#define CLK_GPIOF   0x20
//---GPIO-F REGISTER---//
#define PORTF_DATA  (*((volatile unsigned long *)0x40025038))   //offset of DATA register for PF1, PF2, PF3 is 0x38 [PF7:PF0::9:2]
#define PORTF_DIR   (*((volatile unsigned long *)0x40025400))   //offset of DIR register is 0x400
#define PORTF_DEN   (*((volatile unsigned long *)0x4002551C))   //offset of DEN register is 0x51C
//---PORT-F I/O---//
#define PF1 0x02
#define PF2 0x04
#define PF3 0x08
//---FUNCTION PROTOTYPE---//
void delay(unsigned long);
int main(void)
{
   SYS_CTRL_RCGC2 |= CLK_GPIOF;
   PORTF_DIR |= 0x0000000E;    //set PF1, PF2, PF3 as output
   PORTF_DEN |= 0x0000000E;    //enable PF1, PF2, PF3
   PORTF_DATA = 0;
   while(1)
   {
      PORTF_DATA |= (PF1);
       delay(100000);
      PORTF_DATA |= (PF2);
       delay(100000);
      PORTF_DATA |= (PF3);
       delay(100000);
        PORTF_DATA &= ~(PF1|PF2|PF3);
         delay(100000);
   }
	//return 0;
}
volatile unsigned long i;
void delay(unsigned long count)
{
  i = 0;
  for(i=0; i<count; i++);
}
