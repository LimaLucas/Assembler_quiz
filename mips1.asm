
.text
main:
la $a0, PerguntasFacil

li $v0, 4
syscall

li $v0, 10
syscall

.data
PerguntasFacil: .asciiz "Qual a capital do Brasil ?"
