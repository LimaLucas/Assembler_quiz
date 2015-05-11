.data
	prompt: .asciiz "Digite o numero da alternativa: "
	message: .asciiz "\nSua resposta e "

.text
	#avisa para digitar o numero (numero 4 indica que v0 vai receber um valor tipo stirng)
	li $v0, 4
	la $a0, prompt
	syscall
	
	
	#pega o numero inputado (numero 5 indica que v0 vai receber algum input do teclado, sendo string pois já foi declarado antes)
	li $v0, 5
	syscall
	
	#guardar resultado em t0 (move valor v0 para t0 para a memoria, pois v0 vai ser usado mais vezes)
	move $t0, $v0
	
	# Exibe mensagem 
	li $v0, 4
	la $a0, message
	syscall
	
	# exibir ou mostrar a alternativa
	li $v0, 1
	move $a0, $t0
	syscall
