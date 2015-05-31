.text
	# $s0 -> Utilizado para guardar o ENDEREÇO BASE da MATRIZ de preguntas e do VETOR de respostas
	# $s1 -> Utilizado para guardar o ENDEREÇO da PERGUNTA sorteada, de suas ALTERNATIVAS, e RESPOSTA
	# $s2 -> Utilizado para guardar o ÍNDICE da PERGUNTA sorteada, de suas ALTERNATIVAS, e RESPOSTA
	# $s3 -> Utilizado para salvar o valor da resposta
	# $s4 -> Utilizado para salvar a resposta do jogador
	# $s5 -> número aleatório sorteado, entre 0..3, para selecionar a pergunta, alternativas e resposta
	# $s6 -> NÍVEL
	# $s7 -> AJUDA
	
main:
	li $v0, 4		#\
	la $a0, bemVindo	# Imprime o conteúdo da variável bemVindo
	syscall			#/
	
	li $v0, 4		#\
	la $a0, instrucao	# Imprime o conteúdo da variável intrucao
	syscall			#/
	
	li $s7, 1		# Atribui uma ajuda ao registrador correspondente à AJUDA
	li $s6, 0		# Inicializa o registrador correspondente ao NÍVEL com 0
	
	beq $s6, $zero, NIVEL_1
	j GAME_OVER
		
NIVEL_1:
	li $v0, 42		#\
	li $a1, 4		# Gera número aleatório para pegar o índice da pergunta
	syscall			#/
	
	move $s5, $a0		# Salva o número aleatório para o registrador $s5
	la $s0, mat_nivel_1	# Move o endereço base da matriz para o registrador $s0
	
	### IMPRIME O NIVEL DA PERGUNTA ###
	
	li $v0, 4		#\
	la $a0, print_nivel_1	# Imprime o conteúdo da variável print_nivel_1
	syscall			#/
	
	### PARA IMPRIMIR A PERGUNTA
	
	mul $s2, $s5, 5		# Move para o registrador $s2 o indice da pergunta
	
	mul $s1, $s2, 4		#\
	add $s1, $s1, $s0	# Move para o registrador $s1 o endereço da pergunta sorteada
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a pergunta sorteada
	syscall			#/
	
	### PARA IMPRIMIR AS ALTERNATIVAS
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 1
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 1
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 2
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 2
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 3
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 3
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 4
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 4
	syscall			#/
	
	### PARA SALVAR O VALOR DA RESPOSTA ###
	
	la $s0, vet_respostas	# Move o endereço base do vetor das respostas para $s0
	
	mul $s2, $s6, 4		#\
	add $s2, $s2, $s5	# Salva no registrador $s3 o índice da resposta
	
	mul $s1, $s2, 4		#\
	add $s1, $s1, $s0	# Move para o registrador $s1 o endereço da resposta
	
	lw $s3, 0($s1)		# Salva o valor da resposta no registrador $s3
	
	jal VERIF_AJUDA
	
	li $v0, 4		#\
	la $a0, informeResposta	# Pede para o jogador informar sua resposta
	syscall			#/
	
	li $v0, 5		#
	syscall			# Lê resposta do jogador sobre
	
	move $s4, $v0		# Salva no registrador $s4 a resposta do jogador
	
	beq $s4, $s3, NIVEL_2	# Faz o jogador progredir para o NIVEL 2 caso acerte
	j GAME_OVER		# Termina o jogo caso o jogador erre
	
	
NIVEL_2:
	li $v0, 4		#\
	la $a0, respostaCerta	# Imprime o conteúdo da variável respostaCerta
	syscall			#/
	
	addi $s6, $s6, 1	# Incrementa o NÍVEL do jogo
	
	li $v0, 42		#\
	li $a1, 4		# Gera número aleatório para pegar o índice da pergunta
	syscall			#/
	
	move $s5, $a0		# Salva o número aleatório para o registrador $s5
	la $s0, mat_nivel_2	# Move o endereço base da matriz para o registrador $s0
	
	### IMPRIME O NIVEL DA PERGUNTA ###
	
	li $v0, 4		#\
	la $a0, print_nivel_2	# Imprime o conteúdo da variável print_nivel_1
	syscall			#/
	
	### PARA IMPRIMIR A PERGUNTA
	
	mul $s2, $s5, 5		# Move para o registrador $s2 o indice da pergunta
	
	mul $s1, $s2, 4		#\
	add $s1, $s1, $s0	# Move para o registrador $s1 o endereço da pergunta sorteada
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a pergunta sorteada
	syscall			#/
	
	### PARA IMPRIMIR AS ALTERNATIVAS
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 1
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 1
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 2
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 2
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 3
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 3
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 4
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 4
	syscall			#/
	
	### PARA SALVAR O VALOR DA RESPOSTA ###
	
	la $s0, vet_respostas	# Move o endereço base do vetor das respostas para $s0
	
	mul $s2, $s6, 4		#\
	add $s2, $s2, $s5	# Salva no registrador $s3 o índice da resposta
	
	mul $s1, $s2, 4		#\
	add $s1, $s1, $s0	# Move para o registrador $s1 o endereço da resposta
	
	lw $s3, 0($s1)		# Salva o valor da resposta no registrador $s3
	
	jal VERIF_AJUDA
	
	li $v0, 4		#\
	la $a0, informeResposta	# Pede para o jogador informar sua resposta
	syscall			#/
	
	li $v0, 5		#
	syscall			# Lê resposta do jogador sobre
	
	move $s4, $v0		# Salva no registrador $s4 a resposta do jogador
	
	beq $s4, $s3, NIVEL_3	# Faz o jogador progredir para o NIVEL 2 caso acerte
	j GAME_OVER		# Termina o jogo caso o jogador erre
	

NIVEL_3:
	li $v0, 4		#\
	la $a0, respostaCerta	# Imprime o conteúdo da variável respostaCerta
	syscall			#/
	
	addi $s6, $s6, 1	# Incrementa o NÍVEL do jogo
	
	li $v0, 42		#\
	li $a1, 4		# Gera número aleatório para pegar o índice da pergunta
	syscall			#/
	
	move $s5, $a0		# Salva o número aleatório para o registrador $s5
	la $s0, mat_nivel_3	# Move o endereço base da matriz para o registrador $s0
	
	### IMPRIME O NIVEL DA PERGUNTA ###
	
	li $v0, 4		#\
	la $a0, print_nivel_3	# Imprime o conteúdo da variável print_nivel_1
	syscall			#/
	
	### PARA IMPRIMIR A PERGUNTA
	
	mul $s2, $s5, 5		# Move para o registrador $s2 o indice da pergunta
	
	mul $s1, $s2, 4		#\
	add $s1, $s1, $s0	# Move para o registrador $s1 o endereço da pergunta sorteada
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a pergunta sorteada
	syscall			#/
	
	### PARA IMPRIMIR AS ALTERNATIVAS
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 1
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 1
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 2
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 2
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 3
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 3
	syscall			#/
	
	addi $s1, $s1, 4 	# Move para o registrador $s1 o endereço da alternativa 4
	
	li $v0, 4		#\
	lw $a0, 0($s1)		# Imprime a alternativa 4
	syscall			#/
	
	### PARA SALVAR O VALOR DA RESPOSTA ###
	
	la $s0, vet_respostas	# Move o endereço base do vetor das respostas para $s0
	
	mul $s2, $s6, 4		#\
	add $s2, $s2, $s5	# Salva no registrador $s3 o índice da resposta
	
	mul $s1, $s2, 4		#\
	add $s1, $s1, $s0	# Move para o registrador $s1 o endereço da resposta
	
	lw $s3, 0($s1)		# Salva o valor da resposta no registrador $s3
	
	jal VERIF_AJUDA
	
	li $v0, 4		#\
	la $a0, informeResposta	# Pede para o jogador informar sua resposta
	syscall			#/
	
	li $v0, 5		#
	syscall			# Lê resposta do jogador sobre
	
	move $s4, $v0		# Salva no registrador $s4 a resposta do jogador
	
	beq $s4, $s3, YOU_WIN	# Faz o jogador progredir para o NIVEL 2 caso acerte
	j GAME_OVER		# Termina o jogo caso o jogador erre
	
	
VERIF_AJUDA:
	beq $s7, 1, AJUDA	# Verifica se o jogador pode utilizar a ajuda
	jr $ra			# Volta para o main caso não possa
	
	
AJUDA:	
	li $v0, 4		#\
	la $a0, desejaAjuda	# Pergunta se o jogador deseja utilizar a ajuda
	syscall			#/
	
	li $v0, 5		#
	syscall			# Lê resposta do jogador sobre a ajuda
	
	beq $v0, $zero, SEM_AJUDA	# Verifica se o jogador quer ajuda
	
	addi $sp, $sp, -4	# Adiciona uma posição no Stack Pointer
	sw $ra, 0($sp)		# Grava o conteúdo do $ra atual no Stack Pointer
	
	jal WHILE_AJUDA		# Chama o loop que realiza a operação de ajuda
	
	lw $ra, 0($sp)		# Carrega no $ra o endereço para voltar ao main
	addi $sp, $sp, 4	# Elimina uma posição do Stack Pointer
	
	jr $ra			# Retorna ao main
	
	
WHILE_AJUDA:
	li $v0, 42		#\
	li $a1, 5		# Gera número aleatório para eliminar uma alternativa
	syscall			#/
	
	beq $a0, $s3, WHILE_AJUDA	# Verifica se a alternativa que será eliminada não é a resposta
	beq $a0, $zero, WHILE_AJUDA	# Verifica se a alternativa que será eliminada não é 0
	
	move $t0, $a0		# Move o número aleatório para um registrador temporário
	
	li $v0, 4		#\
	la $a0, naoAlternativa	# Imprime o conteúdo da variável naoAlternativa
	syscall			#/
	
	move $a0, $t0		# Move de volta o número aleatório para $a0
	
	li $v0, 1		#\
	syscall			# Imprime o número da alternativa eliminada
	
	addi $s7, $s7, -1	# Retira o direito de ajuda do jogador
	
	jr $ra			# Retorna para a AJUDA
	
	
SEM_AJUDA:
	jr $ra			# Retorna ao main caso o jogador não queira ajuda
	
	
YOU_WIN:
	li $v0, 4		#\
	la $a0, voceVenceu	# Imprime o conteúdo da variável voceVenceu
	syscall			#/
	
	j EXIT			# Chama o EXIT
	
	
GAME_OVER:
	li $v0, 4		#\
	la $a0, respostaErrada	# Imprime o conteúdo da variável respostaErrada
	syscall			#/
	
	j EXIT			# Chama o EXIT
	
	
EXIT:
	li $v0, 10		#\
	syscall			# Termina a execução do programa
	
	
.data
	bemVindo: .asciiz ">>>>> Bem visndo ao Assembler Quiz <<<<<\n\n"
	instrucao: .asciiz ">>> Você terá apenas uma ajuda durante o jogo para responder uma pergunta \n"
	
	desejaAjuda: .asciiz "\nDeseja utilizar sua ajuda (Não: 0)?"
	informeResposta: .asciiz "\nInforme sua resposta: "
	
	naoAlternativa: .asciiz "Não é a alternativa: "
	respostaErrada: .asciiz "Resposta errada! Fim de jogo.\n"
	respostaCerta: .asciiz "Resposta certa!\n"
	voceVenceu: .asciiz "PARABÉNS! Você venceu o Assembler Quiz\n"
	
	print_nivel_1: .asciiz ">> NIVEL 1\n"
	print_nivel_2: .asciiz ">> NIVEL 2\n"
	print_nivel_3: .asciiz ">> NIVEL 3\n"
	
	vet_respostas: .word 2, 2, 3, 3, 1, 1, 4, 3, 3, 1, 4, 1
	
####### Matríz com as perguntas e alternativas do NÍVEL 1 #######
	
	p11: .asciiz "\nQual é a operação de soma na linguagem de montagem Assembly?"
	a111: .asciiz "\n	1) sum"
	a211: .asciiz "\n	2) add"
	a311: .asciiz "\n	3) plus"
	a411: .asciiz "\n	4) beq"
	
	p21: .asciiz "\nQual registrador possui constantemente o valor 0?"
	a121: .asciiz "\n	1) $0"
	a221: .asciiz "\n	2) $zero"
	a321: .asciiz "\n	3) $a0"
	a421: .asciiz "\n	4) $s0"
	
	p31: .asciiz "\nQual destas operações realiza jump and link?"
	a131: .asciiz "\n	1) jr"
	a231: .asciiz "\n	2) j"
	a331: .asciiz "\n	3) jal"
	a431: .asciiz "\n	4) jar"
	
	p41: .asciiz "\nA operação R[rd] = R[rs] + R[rt] representa qual instrução?"
	a141: .asciiz "\n	1) addi"
	a241: .asciiz "\n	2) subi"
	a341: .asciiz "\n	3) add"
	a441: .asciiz "\n	4) sub"
	
	mat_nivel_1: .word p11, a111, a211, a311, a411,
			   p21, a121, a221, a321, a421,
			   p31, a131, a231, a331, a431,
			   p41, a141, a241, a341, a441,
			   0

####### Matríz com as perguntas e alternativas do NÍVEL 2 #########
	
	p12: .asciiz "\nQual das operações abaixo realiza o armazenamento do valor de um registrador?"
	a112: .asciiz "\n	1) mov"
	a212: .asciiz "\n	2) sub"
	a312: .asciiz "\n	3) str"
	a412: .asciiz "\n	4) add"
	
	p22: .asciiz "\nPara que a diretiva .asciiz serve?"
	a122: .asciiz "\n	1) armazenar a string no segmento de dados com terminador nulo"
	a222: .asciiz "\n	2) armazenar o alfabeto no segmento de dados"
	a322: .asciiz "\n	3) armazenar string no segmento de dados sem terminador nulo"
	a422: .asciiz "\n	4) armazenar integer no segmento de dados"
	
	p32: .asciiz "\nQual das funções abaixo realiza uma comparação entre dois números?"
	a132: .asciiz "\n	1) jal"
	a232: .asciiz "\n	2) ben"
	a332: .asciiz "\n	3) bqe"
	a432: .asciiz "\n	4) beq"
	
	p42: .asciiz "\nA instrução li $v0, 4 seguida pela chamada do sistema serve para:"
	a142: .asciiz "\n	1) imprimir na tela um valor do tipo integer"
	a242: .asciiz "\n	2) imprimir na tela um valor do tipo float"
	a342: .asciiz "\n	3) imprimir na tela uma string"
	a442: .asciiz "\n	4) imprimir na tela um valor do tipo double"
	
	mat_nivel_2: .word p12, a112, a212, a312, a412,
			   p22, a122, a222, a322, a422,
			   p32, a132, a232, a332, a432,
			   p42, a142, a242, a342, a442,
			   0

####### Matríz com as perguntas e alternativas do NÍVEL 3 #########
	
	p13: .asciiz "\nO opcode 000010 corresponde a qual dessas instruções?"
	a113: .asciiz "\n	1) add"
	a213: .asciiz "\n	2) sub"
	a313: .asciiz "\n	3) j"
	a413: .asciiz "\n	4) jal"
	
	p23: .asciiz "\nQual a divisão dos 32 bits do MIPS para a instrução add?"
	a123: .asciiz "\n	1) op, rs, rt, rd, shamt, funct"
	a223: .asciiz "\n	2) op, rt, rd, funct, shamt"
	a323: .asciiz "\n	3) op, rt, rs, rd, funct, shamt"
	a423: .asciiz "\n	4) op, rd, rs, rt, shamt, funct"
	
	p33: .asciiz "\nQual destas instruções é uma pseudo-instrução?"
	a133: .asciiz "\n	1) mov"
	a233: .asciiz "\n	2) break"
	a333: .asciiz "\n	3) j"
	a433: .asciiz "\n	4) move"
	
	p43: .asciiz "\nA instrução slt realiza qual operação?"
	a143: .asciiz "\n	1) R[rd] = (R[rs] < R[rt]) ? 1 : 0"
	a243: .asciiz "\n	2) R[rd] = (R[rs] > R[rt]) ? 1 : 0"
	a343: .asciiz "\n	3) R[rs] = (R[rd] < R[rt]) ? 1 : 0"
	a443: .asciiz "\n	4) R[rd] = (R[rs] <= R[rt]) ? 1 : 0"
	
	mat_nivel_3: .word p13, a113, a213, a313, a413,
			   p23, a123, a223, a323, a423,
			   p33, a133, a233, a333, a433,
			   p43, a143, a243, a343, a443,
			   0
	