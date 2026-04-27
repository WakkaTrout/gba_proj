/* GBA Linker Script */
OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

MEMORY
{
	rom (rx)    : ORIGIN = 0x08000000, LENGTH = 32M
	iwram (rwx) : ORIGIN = 0x03000000, LENGTH = 32K
	ewram (rwx) : ORIGIN = 0x02000000, LENGTH = 256K
}
SECTIONS
{
	/* 1. Header and Boot Code */
	.text.header :
	{
		KEEP(*(.text.header)) /* Must be at 0x08000000 */
	} > rom
	/* 2. Main Code and Read-Only Data */
	.text :
	{
		*(.text .text.*)
		*(.rodata .rodata.*)
		. = ALIGN(4);
	} > rom
	/* 3. IWRAM (Internal Working RAM) - Fast 32-bit access */
	/* Often used for the stack and performance-critical functions */
	.iwram :
	{
		_iwram_start = .;
		*(.iwram .iwram.*)
		. = ALIGN(4);
		_iwram_end = .;
	} > iwram AT > rom
	_iwram_rom_start = LOADADDR(.iwram);
	/* 4. EWRAM (External Working RAM) - Larger but slower 16-bit access */
	.data :
	{
		_data_start = .;
		*(.data .data.*)
		. = ALIGN(4);
		_data_end = .;
	} > ewram AT > rom
	_data_rom_start = LOADADDR(.data);
	/* 5. BSS (Zero-initialized data) */
	.bss :
	{
		_bss_start = .;
		*(.bss .bss.*)
		*(COMMON)
		. = ALIGN(4);
		_bss_end = .;
	} > ewram
	/* Stack pointer initialization (End of IWRAM) */
	__sp_usr = ORIGIN(iwram) + LENGTH(iwram);
}