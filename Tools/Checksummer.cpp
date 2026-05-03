#include <windows.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <stdlib.h>

const char header_string[] = "LOMBAT\0\0\0\0\0\0CLTE8P\x96\0\0\0\0\0\0\0\0\0\0";

inline void gbachecksum()
{
    uint8_t chksum = 0xE7;
    for (int i = 0; i < sizeof(header_string); ++i)
    {
        chksum -= (uint8_t)header_string[i];
    }
    printf("Checksum: %X\n", chksum);
}


#if MAIN_DEBUG
int main()
#else
int CALLBACK WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)
#endif
{
 
  gbachecksum();

  return 0;
}