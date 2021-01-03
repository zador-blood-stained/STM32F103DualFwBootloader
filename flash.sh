#!/bin/sh

#cd $(dirname $(realpath "$0"))

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments, 2 arguments required" >&2
	echo "Usage: ./flash.sh firmware1.bin firmware2.bin" >&2
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "File $1 not found" >&2
	exit 1
fi

if [ ! -f "$2" ]; then
	echo "File $2 not found" >&2
	exit 1
fi

if [ ! -f "build/STM32F103DualFwBootloader.bin" ]; then
	echo "File build/STM32F103DualFwBootloader.bin not found" >&2
	echo "Build the bootloader binary by executing \"make\"" >&2
	exit 1
fi

openocd -f "interface/stlink-v2.cfg" \
		-f "target/stm32f1x.cfg" \
		-c "init" \
		-c "reset init" \
		-c "flash info 0" \
		-c "flash write_image erase unlock build/STM32F103DualFwBootloader.bin 0x08000000 bin" \
		-c "flash write_image erase unlock $1 0x08002000 bin" \
		-c "flash write_image erase unlock $2 0x08010000 bin" \
		-c "reset run" \
		-c "exit"

