# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_queue.c"
# 1 "/Users/neroyang/project/Ceno-RTOS/user//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_queue.c"
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

char uart_debug_reveive_char(void);
# 20 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2

# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os.h"
typedef unsigned int os_task_id_t;
typedef unsigned int os_time_t;

typedef enum os_err{
 OS_ERR = 1,
 OS_ERR_NONE = 0
}os_err_t;

typedef void* cpu_stk_t;
typedef unsigned int cpu_stk_size_t;
typedef char cpu_char_t;

typedef unsigned int priority_t;


typedef unsigned int queue_size_t;



typedef unsigned int sem_count_t;

typedef unsigned int tick_t;

typedef long clock_t;
# 22 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_list.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_list.h"
typedef struct os_list{
 struct os_list* next;
 struct os_list* prev;
}os_list_t;

os_err_t os_list_init(os_list_t* listHead);

uint8_t is_list_empty(os_list_t*list);

os_err_t os_list_insert(os_list_t* head, os_list_t* elem);

os_err_t os_list_add(os_list_t* head, os_list_t* elem);

os_err_t os_list_rm(os_list_t* elem);

os_err_t os_list_rm_init(os_list_t* elem);
# 23 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
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
# 24 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_queue.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_queue.h"
typedef struct os_queue{
 os_obj_t obj;

 uint32_t size;
 uint32_t start;
 uint32_t end;

 uint32_t front;
 uint32_t rear;

 void* elems;
 void* ext;
}os_queue_t;

typedef struct os_msg{
 os_queue_t msgQ;
}os_msg_t;


os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size);

os_err_t os_queue_add_item(os_queue_t* queue, void* itemPtr);

os_err_t os_queue_remove();

os_err_t os_queue_clear();

uint32_t os_queue_size(os_queue_t* queue);
# 25 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_ring_buffer.h" 1
# 17 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_ring_buffer.h"
typedef struct os_ring_buffer{
 uint8_t *buffer;

}os_ring_buffer_t;


os_err_t os_ring_buffer_init(os_ring_buffer_t* buffer);

os_err_t os_ring_buffer_push(os_ring_buffer_t* buffer);

uint8_t os_ring_buffer_pop(os_ring_buffer_t* buffer);

uint8_t os_ring_buffer_is_full(os_ring_buffer_t* buffer);

uint8_t os_ring_buffer_is_empty(os_ring_buffer_t* buffer);
# 26 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 1 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_task.h" 1
# 19 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_task.h"
typedef void (*os_task_handler_t)();

typedef enum task_state{
  OS_STATE_DORMANT = 1,
 OS_STATE_READY = 2,
 OS_STATE_BLOCKED = 3,
 OS_STATE_RUNNING = 5,
 OS_STATE_PENDING = 4,
 OS_STATE_INTERRUPTED = 4
}task_state_t;

typedef struct os_task{
 os_task_id_t id;
 os_obj_t obj;

 cpu_stk_t stkPtr;
 cpu_stk_size_t stackSize;
 os_task_handler_t taskHandler;

 task_state_t state;
 os_time_t timeout;
 priority_t priority;

 os_list_t taskList;

}os_task_t;

os_err_t os_task_create(os_task_t *me,
     cpu_char_t *name,
     priority_t priority,
     cpu_stk_t stkPtr,
     cpu_stk_size_t stackSize,
     os_task_handler_t taskHandler);

os_err_t os_task_switch_next(void);

os_err_t os_task_switch_context(os_task_t *next);

os_err_t os_task_exit(void);


extern os_queue_t* osTaskQueue;


extern os_task_t* volatile osTaskCurr;
extern os_task_t* volatile osTaskNext;
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

os_err_t os_idle(void);

os_err_t os_tick(void);

os_err_t os_sched(void);


extern os_task_t* volatile osIdleTask;
# 30 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/../include/os_api.h" 2
# 2 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_queue.c" 2
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 1 3





# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/_ansi.h" 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/newlib.h" 1 3
# 11 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/_ansi.h" 2 3
# 7 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 2 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 1 3
# 14 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 149 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4

# 149 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 216 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef unsigned int size_t;
# 328 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 15 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/_types.h" 1 3
# 25 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/lock.h" 1 3
# 33 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/lock.h" 3
struct __lock;
typedef struct __lock * _LOCK_T;






extern void __retarget_lock_init(_LOCK_T *lock);

extern void __retarget_lock_init_recursive(_LOCK_T *lock);

extern void __retarget_lock_close(_LOCK_T lock);

extern void __retarget_lock_close_recursive(_LOCK_T lock);

extern void __retarget_lock_acquire(_LOCK_T lock);

extern void __retarget_lock_acquire_recursive(_LOCK_T lock);

extern int __retarget_lock_try_acquire(_LOCK_T lock);

extern int __retarget_lock_try_acquire_recursive(_LOCK_T lock);


extern void __retarget_lock_release(_LOCK_T lock);

extern void __retarget_lock_release_recursive(_LOCK_T lock);
# 26 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;



typedef long _off_t;





typedef int __pid_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;







typedef unsigned short __ino_t;
# 88 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;







typedef long _fpos_t;
# 129 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 357 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 608 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

};
# 814 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 8 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 2 3


# 1 "/Users/neroyang/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 11 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 2 3


# 1 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/machine/malloc.h" 1 3
# 14 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 2 3
# 22 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 3
struct mallinfo {
  size_t arena;
  size_t ordblks;
  size_t smblks;
  size_t hblks;
  size_t hblkhd;
  size_t usmblks;
  size_t fsmblks;
  size_t uordblks;
  size_t fordblks;
  size_t keepcost;
};



extern void *malloc (size_t);




extern void *_malloc_r (struct _reent *, size_t);


extern void free (void *);




extern void _free_r (struct _reent *, void *);


extern void *realloc (void *, size_t);




extern void *_realloc_r (struct _reent *, void *, size_t);


extern void *calloc (size_t, size_t);




extern void *_calloc_r (struct _reent *, size_t, size_t);


extern void *memalign (size_t, size_t);




extern void *_memalign_r (struct _reent *, size_t, size_t);


extern struct mallinfo mallinfo (void);




extern struct mallinfo _mallinfo_r (struct _reent *);


extern void malloc_stats (void);




extern void _malloc_stats_r (struct _reent *);


extern int mallopt (int, int);




extern int _mallopt_r (struct _reent *, int, int);


extern size_t malloc_usable_size (void *);




extern size_t _malloc_usable_size_r (struct _reent *, void *);





extern void *valloc (size_t);




extern void *_valloc_r (struct _reent *, size_t);


extern void *pvalloc (size_t);




extern void *_pvalloc_r (struct _reent *, size_t);


extern int malloc_trim (size_t);




extern int _malloc_trim_r (struct _reent *, size_t);


extern void __malloc_lock(struct _reent *);

extern void __malloc_unlock(struct _reent *);



extern void mstats (char *);




extern void _mstats_r (struct _reent *, char *);
# 166 "/Users/neroyang/gcc-arm-none-eabi/arm-none-eabi/include/malloc.h" 3
extern void cfree (void *);
# 3 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_queue.c" 2


# 4 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_queue.c"
os_err_t os_queue_create(os_queue_t* me, const cpu_char_t* name, uint32_t size){
 uart_debug_print("[queue] queue create : ");
 uart_debug_print(name);
 uart_debug_print("\n\r");
 if(size==0U){
  return OS_ERR;
 }

 os_obj_t obj;
 obj.name = name;
 obj.objType = OS_OBJ_QUEUE_TYPE;

 me->obj = obj;
 me->size = size;



}

os_err_t os_queue_add_item(os_queue_t* queue, void* itemPtr){
 queue->elems = itemPtr;
}

os_err_t os_queue_remove(){

}

os_err_t os_queue_clear(){

}

uint32_t os_queue_size(os_queue_t* queue){

}
