@echo off
echo %DEVKITARM%

C:\devkitPro\devkitARM\bin\arm-none-eabi-gcc.exe -T linker.ld game.c -o game.exe -nostartfiles
