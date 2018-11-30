#ifndef __CENO_RTOS_OS__
#define __CENO_RTOS_OS__

/* Constants */
#define TRUE                    1
#define FALSE                   0

/* Error values */

#define CENO_OK                 0
#define CENO_ERROR              1
#define CENO_TIMEOUT            2




#define NULL      ((void *)(0))

/* Size of each stack entry / stack alignment size (e.g. 8 bits) */
#define STACK_ALIGN_SIZE                sizeof(unsigned char)

/**
 * Architecture-specific types.
 * Uses the stdint.h naming convention, so if stdint.h is available on the
 * platform it is simplest to include it from this header.
 */
#define uint8_t   unsigned char
#define uint16_t  unsigned short
#define uint32_t  unsigned long
#define uint64_t  unsigned long long
#define int8_t    char
#define int16_t   short
#define int32_t   long
#define int64_t   long long
#define POINTER   void *

#endif // __CENO_RTOS_OS__


