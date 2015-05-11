
.data
	p1_1: .asciiz "qual a capital do brasil?"
	p2_1: .asciiz "a 'cidade de deus' é: "
	p3_1: .asciiz "oque 'syscall' significa? "
	p4_1: .asciiz "qual o nome do professor?"
	
	list: .word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
	size: .word 10

	perguntas: .word p1_1,p2_1,p3_1,p4_1,0
	
.text	

	lw $t3, size
	la $t1, list
	li $t2, 0

prnlp:
	beq $t2, $t3, prndn # check for array end
	lw $a0, ($t1) # print list element
	li $v0, 1
	syscall
#	la $a0, NL # print a newline
#	li $v0, 4
#	syscall
	addi $t2, $t2, 1 # advance loop counter
	addi $t1, $t1, 4 # advance array pointer
	b prnlp # repeat the loop


prndn:
	lw $a0, ($t1) # takes value via register $a0
	li $v0, 1 # takes syscall # via register $v0
	syscall
	
	#la $a0, NL # takes address of string via $a0
#	li $v0, 4 # takes syscall # via register $v0
#	syscall
	
#	li $v0, 4
#	lw $s0, perguntas
#	syscall
	
#	li $v0, 4
#	lw $a0, 0($s0)
	
	
#	li $a1, 4
#	li $v0, 42
#	syscall

	