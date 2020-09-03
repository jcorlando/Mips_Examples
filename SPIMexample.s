.text
.globl main
main:
li $t0, 12
li $t1, 22
addu $t0, $t0, $t1

move $a0, $t0
li $v0, 1
syscall

li $v0, 10
syscall