@echo off
echo %DEVKITARM%

::-mtune=arm7tdmi
::-fomit-frame-pointer
::-ffast-math
::-Wno-class-memaccess

C:\devkitPro\devkitARM\bin\arm-none-eabi-gcc.exe -mcpu=arm7tdmi -mthumb -mthumb-interwork -o3 -nostartfiles -T linker.ld -o game.elf game.c && C:\devkitPro\devkitARM\bin\arm-none-eabi-objcopy -O binary game.elf game.gba && rm game.elf
