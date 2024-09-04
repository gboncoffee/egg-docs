# RISC-V IM 32

## Sintaxe de Assembly

A implementação de RISC-V para o EGG usa a sintaxe de Assembly padrão. Ela
implementa os registradores e instruções do conjunto base e da extensão de
multiplicação descritos [nesse documento](/static/riscv.pdf).

Para consulta, também há uma cheatsheet mais abaixo.

## Chamadas (_environment call_)

Para realizar uma chamada (_environment call_), o número dela é colocado no
registrador `a7` e os argumentos nos registradores `a0` e `a1`.

Uma instrução `ebreak` realiza a chamada BREAK.

## Exemplo

Código de exemplo (escreve "Hello, World!", quebra a linha e sai):

```asm
	addi a7, zero, 3
	addi a0, zero, msg
	addi a1, zero, 14
	ecall
	ebreak

msg:
#Hello, World!%0a
```

## Memória

O programa montado é carregado no endereço `0` e o `pc` é inicializado em `0`. O
ponteiro da stack não é inicializado. Caso o programa faça uso da stack, ela
deve ser inicializada no programa.
