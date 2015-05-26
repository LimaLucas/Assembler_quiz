.data
	desejaAjuda: .asciiz "\nDeseja utilizar sua ajuda (Não: 0)?"
	
	p11: .asciiz "\nPergunta 1?"
	a111: .asciiz "\n	1) 1 Alternativa 1"
	a211: .asciiz "\n	2) 1 Alternativa 2"
	a311: .asciiz "\n	3) 1 Alternativa 3"
	a411: .asciiz "\n	4) 1 Alternativa 4"
	
	p21: .asciiz "\nPergunta 2?"
	a121: .asciiz "\n	1) 2 Alternativa 1"
	a221: .asciiz "\n	2) 2 Alternativa 2"
	a321: .asciiz "\n	3) 2 Alternativa 3"
	a421: .asciiz "\n	4) 2 Alternativa 4"
	
	p31: .asciiz "\nPergunta 3?"
	a131: .asciiz "\n	1) 3 Alternativa 1"
	a231: .asciiz "\n	2) 3 Alternativa 2"
	a331: .asciiz "\n	3) 3 Alternativa 3"
	a431: .asciiz "\n	4) 3 Alternativa 4"
	
	p41: .asciiz "\nPergunta 4?"
	a141: .asciiz "\n	1) 4 Alternativa 1"
	a241: .asciiz "\n	2) 4 Alternativa 2"
	a341: .asciiz "\n	3) 4 Alternativa 3"
	a441: .asciiz "\n	4) 4 Alternativa 4"
	
	nivel_1: .word 	p11, a111, a211, a311, a411,
			p21, a121, a221, a321, a421,
			p31, a131, a231, a331, a431,
			p41, a141, a241, a341, a441,
			0
	
.text
	# $s7 -> AJUDA
	# $s6 -> NÍVEL
	# $s5 -> número sorteado para selecionar a pergunta e alternativas
	# $s0 -> endereço base da matriz
	# $s1 -> endereço da pergunta sorteada e de suas alternativas
	# $s2 -> indice da pergunta sorteada e de suas alternativas
	# $s3 -> 
	# $s4 -> 
	
	li $s7, 1		# AJUDA
	li $s6, 1		# NÍVEL do jogo

	li $v0, 42		#\
	li $a1, 4		# Gera número aleatório para pegar o índice da pergunta
	syscall			#/
	
	move $s5, $a0		# Move o número aleatório para o registrador $s5
	la $s0, nivel_1		# Move o endereço base da matriz para o registrador $s0
	
	# PARA IMPRIMIR A PERGUNTA
	mul $s2, $s5, 5	# Salva no registrador $s2 o indice da pergunta
	
	mul $s1, $s2, 4		# Salva no registrador $s1 o endereço da pergunta sorteada
	add $s1, $s1, $s0	#/
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a pergunta sorteada
	syscall			#/
	
	# PARA IMPRIMIR AS ALTERNATIVAS
	addi $s1, $s1, 4 	# Salva no registrador $s1 o endereço da alternativa 1
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 1
	syscall			#/
	
	addi $s1, $s1, 4 	# Salva no registrador $s1 o endereço da alternativa 2
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 2
	syscall			#/
	
	addi $s1, $s1, 4 	# Salva no registrador $s1 o endereço da alternativa 3
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 3
	syscall			#/
	
	addi $s1, $s1, 4 	# Salva no registrador $s1 o endereço da alternativa 4
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 4
	syscall			#/
	
	jal VERIF_AJUDA
	
VERIF_AJUDA:
	beq $s7, 1, AJUDA
	jr $ra

AJUDA:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $v0, 4		#\
	la $a0, desejaAjuda	# Pergunta se o jogador deseja utilizar a ajuda
	syscall			#/
	
	li $v0, 5		#
	syscall			# Lê resposta do jogador sobre a ajuda
	
	beq $v0, $zero, SEM_AJUDA
	
	
SEM_AJUDA:
	lw $ra, 0($sp)
	addi $sp $sp, 4
	
	jr $ra
	
	
	
	
	
	
	