# RISC-V IM 32

## Assembly

The RISC-V implementation for EGG uses the standard Assembly syntax. It
implements the registers and instructions from the base integer set and the
multiplication extension described in [this](/static/riscv.pdf) document.

## Environment calls

Environment call numbers are placed in the `a7` register, and arguments are
placed in `a0` and `a1`.

An `ebreak` instruction will perform a BREAK call.

## Example

Example program (writes "Hello, World!", breaks a line and exits):

```asm
	addi a7, zero, 3
	addi a0, zero, msg
	addi a1, zero, 14
	ecall
	ebreak

msg:
#Hello, World!%0a
```

## Memory

The assembled program is loaded at the address `0` on the machine startup, and
the `pc` register is set to `0`. The stack pointer register is not initialized:
the program should initialize it if it wants to use the stack.
