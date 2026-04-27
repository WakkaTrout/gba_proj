// Startup Assembly (A.I Generated (along with the linker script, need to double check this is correc))
__asm__ (
    ".section .text.header\n"
    ".arm\n"
    ".global _start\n"
    "_start:\n"
    "    b rom_header_end\n"
    "    .fill 156, 1, 0\n" // Placeholder for GBA Logo & Fixed Header
    "rom_header_end:\n"
    "    ldr r0, =__sp_usr\n" // Symbols from your linker script
    "    mov sp, r0\n"
    "    b main\n"            // Jump to C
);

int main( void )
{
	return 0;
}
