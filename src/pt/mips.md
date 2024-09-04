# MIPS32

## Assembly

A implementação de MIPS32 para o EGG usa a sintaxe de Assembly padrão.

## Chamadas (_environment call_)

Para realizar uma chamada (_environment call_), o número dela é colocado no
registrador `v0` e os argumentos nos registradores `a0` e `a1`.

Uma instrução `break` realiza a chamada BREAK.

## Memória

O programa montado é carregado no endereço `0` e o `pc` é inicializado em `0`.
