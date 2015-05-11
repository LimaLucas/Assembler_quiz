
.data
	mensagem_alternativa: .asciiz "Digite o numero da alternativa: "
	mensagem_game_over: .asciiz "\nERROOO! \nGame Over!\n"
	mensagem_win: .asciiz "\nFim de jogo, YOU ARE THE CHAMPION!\n"
	
	array_perguntas1: .space 2000 # 100 para cada pergunta (20 perguntas x 100)
	
	prompt: .asciiz "\nEnter com uma string: "
	Line: .asciiz "\n"
	
.text
	# seta ajuda com valor 1
	li $s1, 1	#valor snedo passado
	
	li $v0, 1	#tipo sendo passado(tipo 1 = integer) e impressão na tela (valor no registrador = 1)
	move $a0, $s1
	syscall
