# ====================================================================
# 项目目录
BASE_DIR=/Users/neroyang/project/Ceno-RTOS
BUILD_DIR=build
DEBUG_DIR=debug
# ====================================================================
# 项目名称
PROJECT_NAME=CenoRTOS
# 开发板支持
ARCH=arm32
BOARD=ek-TM4C123gxl
MCU=TM4C123GH6PM
LINK_FILE=link.ld
OCD_CFG_FILE=ek-tm4c123gxl.cfg

# BOARD=alios_things_starter_kit
# MCU=stm32l
# LINK_FILE=STM32L433RCTxP_FLASH.ld
# OCD_CFG_FILE=stm32l4discovery.cfg
# ====================================================================
# 用户C代码
SRC=$(wildcard src/*.c)
# 板载C代码
SRC+=$(wildcard $(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/src/*.c)
# 内核C代码
SRC+=$(wildcard $(BASE_DIR)/kernel/ceno/src/*.c)
# 硬件抽象层C代码
SRC+=$(wildcard $(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/ceno_os/src/*.c)

# 用户汇编代码
ASM=$(wildcard src/*.s)
# 板载汇编代码
ASM+=$(wildcard $(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/src/*.s)
# 内核汇编代码
# 硬件抽象层汇编代码

OBJ=obj/
OBJS=$(addprefix $(OBJ),$(notdir $(SRC:.c=.o)))
OBJS+=$(addprefix $(OBJ),$(notdir $(ASM:.s=.o)))

OPTMIZE=optimize/
OPTMIZES=$(addprefix $(OPTMIZE),$(notdir $(SRC:.c=.i)))
OPTMIZES+=$(addprefix $(OPTMIZE),$(notdir $(ASM:.s=.i)))

ASMCODE=asm/
ASMCODES=$(addprefix $(ASMCODE),$(notdir $(OPTMIZE:.i=.s)))
# ASMCODES+=$(addprefix $(ASMCODE),$(notdir $(ASM:.s=.i)))

# ====================================================================
# CMSMS
CMSIS=$(BASE_DIR)/lib/SMSIS/Include
# QPC
QPC=$(BASE_DIR)/lib/QPC/Include
# 内核
CENO_KERNEL=$(BASE_DIR)/kernel/ceno/include
# drivers
DRIVERS=$(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/include
# bsp
BSP=$(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/ceno_os/include
# include
CPPFLAGS=-I include
CPPFLAGS += -I ${DRIVERS}
CPPFLAGS += -I ${CMSIS}
CPPFLAGS += -I ${QPC}
CPPFLAGS += -I ${CENO_KERNEL}
CPPFLAGS += -I ${BSP}
# ====================================================================
CFLAGS=-ggdb -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
# CFLAGS += -Os -ffunction-sections -fdata-sections -MD -std=c99
CFLAGS += -MD -std=c99
CFLAGS += -pedantic -DPART_${MCU} -c 
CFLAGS += -DTARGET_IS_BLIZZARD_RA1
CFLAGS += -w
# ====================================================================

# ASFLAGS=-ggdb -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
# ASFLAGS += -ffunction-sections -fdata-sections -MD -std=c99
# ASFLAGS += -pedantic -DPART_${MCU} -c 
# ASFLAGS += -DTARGET_IS_BLIZZARD_RA1

# ====================================================================
# 链接脚本
LD_SCRIPT=$(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/ld/${LINK_FILE}
LDFLAGS=-T $(LD_SCRIPT) --entry Reset_Handler --gc-sections
# ====================================================================
# 编译器
CC=~/gcc-arm-none-eabi/bin/arm-none-eabi-gcc
AS=~/gcc-arm-none-eabi/bin/arm-none-eabi-as
CXX=~/gcc-arm-none-eabi/bin/arm-none-eabi-g++
LD=~/gcc-arm-none-eabi/bin/arm-none-eabi-ld
OBJCOPY=~/gcc-arm-none-eabi/bin/arm-none-eabi-objcopy
ELFREAD=~/gcc-arm-none-eabi/bin/arm-none-eabi-readelf
# ====================================================================
MKDIR=@mkdir -p $(@D)
# ====================================================================
# openOCD目录
OPENOCD_SCRIPT_DIR=/usr/local/share/openocd/scripts/board
# ====================================================================
# flash
FLASH_SECTOR=255
# ====================================================================