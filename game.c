// Startup Assembly (A.I Generated (along with the linker script, need to double check this is correct))
__asm__ (
    ".section .text.header\n" // Places this code into the .text.header section of the ROM. Linker script places this at the very beginning
    ".arm\n" // TODO: is this needed?
    ".global _start\n" // TODO: do we really need to make this a global symbol?
    "_start:\n"
    "    b rom_header_end\n" // This branch is required (per the GBA spec) and must jump past the ROM header (TODO: should it be relative address or an absolute address? If absolute, should it be ROM address or IWRAM address?
    "    .fill 156, 1, 0\n" // Placeholder for GBA Logo & Fixed Header (TODO Change this to the actual fixed header. NOTE: the header is longer than 156 bytes. The first 156 bytes are the actual header itself
    "rom_header_end:\n" // TODO: will this label work? do we need to put this in the iwram section?
    "    ldr r0, =__sp_usr\n" // TODO: Is this calculated correctly in the linker script? Is the stack being put in the correct section?
    "    mov sp, r0\n"
    "    b main\n"            // Jump to C
);

int main( void )
{
	return 0;
}
