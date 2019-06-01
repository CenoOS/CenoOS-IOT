# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_heap.c"
# 1 "/Users/neroyang/project/Ceno-RTOS/user//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_heap.c"
# 13 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_heap.c"
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h"
# 1 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 1 3 4
# 9 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 3 4
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 3 4
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 2 3 4
# 18 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2

# 1 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/include/uart_debug.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/include/uart_debug.h"

# 17 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/include/uart_debug.h"
void uart_debug_init(void);

void uart_debug_print(char* str);

void uart_debug_print_char(char c);

void uart_debug_print_i32(unsigned int v,unsigned int mode);

char uart_debug_reveive_char(void);

void uart_debug_print_os_register();
# 20 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2

# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os.h" 1
# 22 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os.h"
typedef unsigned int os_task_id_t;
typedef unsigned int os_time_t;

typedef enum os_err{
 OS_ERR = 1,
 OS_ERR_NONE = 0
}os_err_t;

typedef void* cpu_stk_t;
typedef unsigned int cpu_stk_size_t;
typedef char cpu_char_t;

typedef unsigned int os_size_t;

typedef unsigned int priority_t;


typedef unsigned int queue_size_t;



typedef unsigned int sem_count_t;

typedef unsigned int tick_t;

typedef long clock_t;
# 22 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_heap.h" 1
# 19 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_heap.h"
extern uint32_t _stack_ptr;

extern uint32_t _etext;

extern uint32_t _data;
extern uint32_t _edata;

extern uint32_t _bss;
extern uint32_t _ebss;

typedef struct os_heap_block os_heap_block_t;
struct os_heap_block{
 os_size_t size;
 os_heap_block_t* next;
 os_heap_block_t* prior;
};


os_err_t os_heap_init();
os_heap_block_t* os_heap_find_block(os_size_t size);
void* os_heap_malloc(os_size_t size);
void* os_heap_realloc (void* ptr, os_size_t newSize);
uint32_t os_heap_free(void* ptr);

void* os_heap_calloc (os_size_t num, os_size_t size);
# 23 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_list.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_list.h"
typedef struct os_list{
 struct os_list* next;
 struct os_list* prev;
}os_list_t;

os_err_t os_list_init(os_list_t* listHead);

uint8_t os_list_empty(os_list_t*list);

os_err_t os_list_insert(os_list_t* head, os_list_t* elem);

os_err_t os_list_add(os_list_t* head, os_list_t* elem);

os_err_t os_list_rm(os_list_t* elem);

os_err_t os_list_rm_init(os_list_t* elem);
# 24 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_obj.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_obj.h"
typedef enum obj_type{
 OS_OBJ_TYPE_NONE = 0,
 OS_OBJ_TASK_TYPE,
 OS_OBJ_SEM_TYPE,
 OS_OBJ_MUTEX_TYPE,
 OS_OBJ_QUEUE_TYPE,
 OS_OBJ_BUFFER_TYPE,
}obj_type_t;

typedef struct os_obj{
 os_list_t list;
 const cpu_char_t* name;
 obj_type_t objType;
}os_obj_t;

typedef struct os_obj_list{
 os_list_t taskHead;
# 50 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_obj.h"
}os_obj_list_t;


os_err_t os_obj_container_init(void);
# 25 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_queue.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_queue.h"
typedef struct os_queue{
 os_obj_t obj;

 uint32_t size;
 uint32_t front;
 uint32_t rear;

 uint32_t* elems;
}os_queue_t;


os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size);

os_err_t os_queue_item_en(os_queue_t* queue, uint32_t* itemPtr);
os_err_t os_queue_item_de(os_queue_t* queue, uint32_t* itemPtr);

os_err_t os_queue_clear(os_queue_t* queue);

uint32_t os_queue_length(os_queue_t* queue);

uint32_t os_queue_is_empty(os_queue_t* queue);
uint32_t os_queue_is_full(os_queue_t* queue);

uint32_t os_queue_traverse(os_queue_t* queue);
# 26 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_task.h" 1
# 16 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_task.h"
typedef os_err_t (*os_task_handler_t)();

typedef enum task_state{
  OS_STATE_DORMANT = 1,
 OS_STATE_READY = 2,
 OS_STATE_BLOCKED = 3,
 OS_STATE_RUNNING = 5,
 OS_STATE_PENDING = 4,
 OS_STATE_INTERRUPTED = 4
}task_state_t;

typedef struct os_task{
 cpu_stk_t sp;
 cpu_stk_size_t stackSize;
 os_task_handler_t taskHandler;
 os_task_id_t id;
 os_obj_t obj;
 task_state_t state;
 os_time_t timeout;
 priority_t priority;
 os_list_t taskList;
}os_task_t;

os_err_t os_task_create(os_task_t *me,
     cpu_char_t *name,
     priority_t priority,
     cpu_stk_t stkSto,
     cpu_stk_size_t stackSize,
     os_task_handler_t taskHandler);

os_err_t os_task_switch_next(void);

os_err_t os_task_switch_context(os_task_t *next);

os_err_t os_task_exit(void);


extern os_queue_t osTaskQueue;

extern os_task_t * volatile osTaskCurr;
extern os_task_t * volatile osTaskNext;
# 27 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_semphore.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_semphore.h"
typedef struct os_semphore{
 os_obj_t obj;
 sem_count_t count;
 sem_count_t peakCount;
 os_queue_t blockTasks;
 os_list_t semList;
}os_semphore_t;


os_err_t os_sem_create(os_semphore_t* sem, const cpu_char_t *name, sem_count_t count);

os_err_t os_sem_del(os_semphore_t* sem);

os_err_t os_sem_give(os_semphore_t* sem);

os_err_t os_sem_take(os_semphore_t* sem, tick_t ticks);

os_err_t os_sem_count_get(os_semphore_t* sem, sem_count_t* count);

os_err_t os_sem_count_set(os_semphore_t* sem, sem_count_t count);
# 28 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_mutex.h" 1
# 18 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_mutex.h"
typedef struct os_mutex{
 os_obj_t obj;
 os_task_t *mutexTask;
 struct os_mutex *mutexList;

}os_mutex_t;

os_err_t os_mutex_create(os_mutex_t mutex, cpu_char_t cpu);
# 29 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_kernel.h" 1
# 18 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_kernel.h"
os_err_t os_init(void);

os_err_t os_run(void);

void task_idle_thread(void);
os_err_t os_idle(void);

os_err_t os_tick(void);

os_err_t os_sched(void);


extern volatile os_task_t osIdleTask;
# 30 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 14 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_heap.c" 2
# 24 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_heap.c"
static char *HEAP_START_ADDR;

void *memcpy(void *dest, const void *src, os_size_t count);

char *sbrk(os_size_t incr){
 char *prevHeapEnd;
 if (HEAP_START_ADDR == ((void*)0)){
  HEAP_START_ADDR = &_ebss;
 }
 prevHeapEnd = HEAP_START_ADDR;

 if (HEAP_START_ADDR + incr > &_stack_ptr)
 {

  uart_debug_print("[heap] sbrk: Heap and stack collision\n\r");
 }
 HEAP_START_ADDR += incr;
 uart_debug_print("[heap] sbrk: expand '");
 uart_debug_print_i32(incr,10);
 uart_debug_print("' at '");
 uart_debug_print_i32(HEAP_START_ADDR,16);
 uart_debug_print("'\n\r");
 return prevHeapEnd;
}

os_err_t os_heap_init(){
 HEAP_START_ADDR = &_ebss;
 uart_debug_print("[heap] kernel heap: initial at '0x");
 uart_debug_print_i32((unsigned int)HEAP_START_ADDR,16);
 uart_debug_print("'\n\r");

 uart_debug_print("[heap] user heap: initial at '0x");
 uart_debug_print_i32((unsigned int)HEAP_START_ADDR + 2048,16);
 uart_debug_print("'\n\r");

 os_heap_block_t *block = sbrk((((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7));
 block->size = (((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7);
 block->next = block;
 block->prior = block;

 uint32_t *a = os_heap_malloc(3*sizeof(uint32_t));
 a[0] = 1;
 a[1] = 2;
 a[2] = 3;
 os_heap_free(a);
 uint32_t *b = os_heap_malloc(2*sizeof(uint32_t));
 b[0] = 4;
 b[1] = 5;
 b[2] = 5;
 b[3] = 5;
 b[4] = 5;
 b[5] = 5;
 b[6] = 5;
 b[7] = 5;
 b[8] = 5;

 uint32_t *c = os_heap_malloc(10*sizeof(uint32_t));
 os_heap_free(c);
 uint32_t *d = os_heap_malloc(10*sizeof(uint32_t));
 os_heap_free(d);
 uint32_t *e = os_heap_malloc(10*sizeof(uint32_t));
 os_heap_block_t* blocks[11];
 for(int i = 0; i<10;i++){
  blocks[i] = os_heap_malloc(i*sizeof(uint32_t));
 }
 for(int i = 0; i<10;i++){
  os_heap_free(blocks[i]);
 }
 print_heap();

 return OS_ERR_NONE;
}



os_heap_block_t* os_heap_find_block(os_size_t size){
 os_heap_block_t *block;
 for(block = ((os_heap_block_t *)&_ebss)->next;
     block != &_ebss && (block->size < size);
     block = block->next);

 if(block != &_ebss){
  return block;
 }else{
  return ((void*)0);
 }
}

void* os_heap_malloc(os_size_t size){
 os_size_t newSize = ((((((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7) + size) + (8 -1)) & ~0x7);
 os_heap_block_t *block = os_heap_find_block(newSize);

 if(block == ((void*)0)){
  block = sbrk(newSize);
  if((long)block == -1){
   return ((void*)0);
  }else{
   block->size = newSize | 1;
  }
 }else{
  block->size |= 1;
  block->prior->next = block->next;
  block->next->prior = block->prior;
 }
 return (char *)block + (((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7);
}

void* os_heap_realloc (void* ptr, os_size_t newSize){
 os_heap_block_t *block = ptr - (((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7);
 void *newPtr = os_heap_malloc(newSize);
 if(newPtr == ((void*)0)){
  return ((void*)0);
 }
 uint32_t copySize = block->size + (((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7);
 if(newSize < copySize){
  copySize = newSize;
 }
 memcpy(newPtr, ptr, copySize);
 os_heap_free(ptr);
 return newPtr;
}

uint32_t os_heap_free(void* ptr){
 os_heap_block_t *block = ptr - (((sizeof(os_heap_block_t)) + (8 -1)) & ~0x7),
      *head = &_ebss;
 block->size &= ~1;
 block->next = head->next;
 block->prior = head;
 head->next = block;
 block->next->prior = block;
}

void* os_heap_calloc (os_size_t num, os_size_t size){
 return os_heap_malloc(num*size);
}

void *memcpy(void *dest, const void *src, os_size_t count){
 if (dest == ((void*)0) || src == ((void*)0))
 {
  return ((void*)0);
 }
 char* pdest =(char*) dest;
 char* psrc = (char*)src;
 while (count--)
 {
  *pdest++ = *psrc++;
 }
 return dest;
}


void print_heap(){
 os_heap_block_t *block = &_ebss;
 while(block < (os_heap_block_t *)(&_ebss + 2048)){
  if(block->size & 1){
   uart_debug_print("[heap] alloced block: at '");
  }else{
   uart_debug_print("[heap] free block: at '");
  }
  uart_debug_print_i32(block,16);
  uart_debug_print("',size ");
  uart_debug_print_i32((os_heap_block_t *)(block->size & ~1),10);
  uart_debug_print("\n\r");

  block = (os_heap_block_t *)((char *)block + (block->size & ~1));
 }
}
