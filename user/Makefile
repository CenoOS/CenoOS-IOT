include ../conf/conf.mk

MATCH="match"

build: $(OBJS) bin/$(PROJECT_NAME).bin
# ==================================================================
# 用户C代码
$(OBJ)%.o: src/%.c
	$(MKDIR)
	$(CC) -o $@ $^ $(CPPFLAGS) $(CFLAGS)

# 板载C代码
$(OBJ)%.o: $(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/src/%.c
	$(MKDIR)
	$(CC) -o $@ $^ $(CPPFLAGS) $(CFLAGS)

# 板子硬件抽象层C代码
$(OBJ)%.o: $(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/ceno_os/src/*.c
	$(MKDIR)
	$(CC) -o $@ $^ $(CPPFLAGS) $(CFLAGS)

# 内核C代码
$(OBJ)%.o: $(BASE_DIR)/kernel/ceno/src/*.c
	$(MKDIR)
	$(CC) -o $@ $^ $(CPPFLAGS) $(CFLAGS)


# 用户汇编代码
$(OBJ)%.o: src/%.s
	$(MKDIR)
	$(AS) -o $@ $^ $(CPPFLAGS) $(ASFLAGS)

# 板载汇编
$(OBJ)%.o: $(BASE_DIR)/board/arch/${ARCH}/${BOARD}/${MCU}/src/%.s
	$(MKDIR)
	$(AS) -o $@ $^ $(CPPFLAGS) $(ASFLAGS)

# ==================================================================

bin/$(PROJECT_NAME).elf: $(OBJS)
	$(MKDIR)              
	$(LD) -o $@ $^ $(LDFLAGS)

bin/$(PROJECT_NAME).bin: bin/$(PROJECT_NAME).elf
	$(OBJCOPY) -O binary $< $@

# ==================================================================

read:
	${ELFREAD}  -h  ${BASE_DIR}/${BUILD_DIR}/os.elf

debug:
	echo ${OBJS}

# 查看当前系统OPENOCD支持开发板
openOCD_boards:
	ls ${OPENOCD_SCRIPT_DIR}

# 连接
openOCD_connect:
	nohup openocd -f ${OPENOCD_SCRIPT_DIR}/${OCD_CFG_FILE} &

flash:
	(echo halt;echo flash erase_sector 0 0 ${FLASH_SECTOR};echo flash write_image erase ${BASE_DIR}/user/bin/${PROJECT_NAME}.bin 0;echo reset;) | telnet localhost 4444 | grep "#0"

verify:
	(echo halt;echo flash verify_bank 0 ${BASE_DIR}/user/bin/${PROJECT_NAME}.bin 0;) | telnet localhost 4444 | grep ${MATCH}

clean:
	rm -rf ${BASE_DIR}/user/bin
	rm -rf ${BASE_DIR}/user/obj

usb:
	# system_profiler SPUSBDataType
	lsusb

doc:
 	`/usr/local/Cellar/node/7.4.0/lib/node_modules/docsify-cli/bin/docsify serve ../docs/docs`
