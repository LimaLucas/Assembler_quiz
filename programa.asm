
.data
	mensagem_alternativa: .asciiz "Digite o numero da alternativa: "
	mensagem_game_over: .asciiz "\nERROOO! \nGame Over!\n"
	mensagem_win: .asciiz "\nFim de jogo, YOU ARE THE CHAMPION!\n"
	
#	array_perguntas1: .space 
	
.text
	# seta ajuda com valor 1
	li $s1, 1	#valor snedo passado
	
	li $v0, 1	#tipo sendo passado(tipo 1 = integer) e impressão na tela (valor no registrador = 1)
	move $a0, $s1
#	syscall