# Usage

Running the emulator with an Assembly file will assemble it and start a machine
to run it on. By default, the machine is a RISC-V IM 32 bits. Use the flag `-a`
or `-arch` to change the architeture. Run `egg -h` to see all command line
options and `egg -l` to see all supported architetures.

The Assembly syntax is architeture-dependent. Though, a library is provided for
creating assembler, so backends may use the same overall syntax (both RISC-V and
MIPS uses it).

## Assembly

An example follows:

```asm
; Semicolon makes a comment til the end of line.

; A label is defined with :.
label:
	; Instruction arguments starts with destination.
	addi t0, zero, 2

	; You may also put instructions after the labels.
label2:	add t0, t0, t0

	; There's no parenthesis as in RARS, store uses common immediates.
	sb t0, ra, 3

	; Hex, octal and binary immediates are supported.
	addi t1, zero, 0xff
	addi t1, zero, 0b010110
	addi t1, zero, 0o644
	addi t1, zero, 0755	; A leading 0 also defines an octal.

; A # defines a literal til the end of the line.
; Literals are inserted unchanged to the binary (as 'db' in other assemblers).
; If a % is followed by two hex digits, the hex value is inserted instead. Use
; %% to escape it.
msg:
#Hello, World!%0a

; Some directives are supported. "bitsxx" ones creates literal numbers in the
; code, with the bit length specified:
.bits8 0xca 0xfe 0xba 0xbe 0xde 0xad 0xbe 0xef
.bits16 0xcafe 0xbabe 0xdead 0xbeef
.bits32 0xcafebabe 0xdeadbeef
.bits64 0xcafebabedeadbeef
; The "space" directive adds some bytes of spacing in the code:
.space 16
; The "include" directive "copy-pastes" another file in the code:
.include other-asm.asm
```

Each architeture folder has test Assembly files you may use as examples.

## Calls

Standard calls handled by the emulator are as follows. Refer to the architeture
documentation on how to perform them:

- BREAK (Number 1): Transfer control to debugger or stop the machine.  
  No arguments.  
- READ (Number 2): Read input.  
  - Argument 1: Buffer address.  
  - Argument 2: Size of input in bytes.  
- WRITE (Number 3): Write output.  
  - Argument 1: Buffer address.  
  - Argument 2: Size of output in bytes.  

## Debugger

The debugger interface is kinda similar to `gdb`, though much smaller. Use the
`-d` flag to enter debugger uppon startup. There's no need of `run` command, as
there's no process. The `next` or the `continue` commands may be used to start
running the program normally. Use `help` to see all available commands.
