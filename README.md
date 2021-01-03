# STM32F103DualFwBootloader

Bootloader that allows switching between 2 firmwares at boot time.
Developed and tested on a relatively cheap STM32F103CBT6 based "Black pill" board, utilizing the `BOOT1` jumper (pin `PB2`) for switching between 2 firmwares.

Tested by putting [i2c-star](https://github.com/daniel-thompson/i2c-star) and [stm32-vserprog](https://github.com/dword1511/stm32-vserprog) projects on a single development board.

Linker script memory regions configuration for project1

```
MEMORY
{
	rom (rx) : ORIGIN = 0x08002000, LENGTH = 60K
	ram (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}
```

Linker script memory regions configuration for project2

```
MEMORY
{
	rom (rx) : ORIGIN = 0x08010000, LENGTH = 60K
	ram (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}
```
