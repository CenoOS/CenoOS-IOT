![CenoOS](https://raw.githubusercontent.com/CenoOS/Ceno-RTOS/master/docs/assets/twitter_header_photo_1.png)

#### CenoOS is a real time operating system for IOT devices from cenocloud.



## Architecture Overview

![Architecture](https://raw.githubusercontent.com/CenoOS/Ceno-RTOS/master/docs/assets/arch.png)



## Documentation

> ### Prepare

#### 1. 选择开发版

##### 在根目录/conf/makefile.conf中修改如下配置:

```makefile
# 开发板支持
ARCH=arm32
BOARD=ek-TM4C123gxl
MCU=TM4C123GH6PM
LINK_FILE=link.ld
OCD_CFG_FILE=ek-tm4c123gxl.cfg
```

##### 其中选项对应board下支持的开发版

#### 2. 配置openOCD script目录:

```makefile
OPENOCD_SCRIPT_DIR=/usr/local/share/openocd/scripts/board
```

#### 3. 配置项目跟目录:

```makefile
BASE_DIR=/Users/neroyang/project/Ceno-RTOS

```

> ### build

#### 1. openOCD启动:

```bash
cd user
make openOCD_connect
```

#### 2. 构建

```bash
make clean
make build
```

#### 3. 烧写

```bash
make flash
```

> ### last

#### have a good trial!