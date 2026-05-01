@echo off
echo %DEVKITARM%

C:\devkitPro\devkitARM\bin\arm-none-eabi-gcc.exe -mthumb -mthumb-interwork -nostartfiles -T linker.ld -o game.elf game.c && C:\devkitPro\devkitARM\bin\arm-none-eabi-objcopy -O binary game.elf game.gba && rm game.elf
