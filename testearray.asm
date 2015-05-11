.data
	buffer: .space 1025 # 1024 maximum, plus a terminator
	user_prompt: .asciiz "Enter ... of no more than 1024 characters.\n"

main:

	## Prompt the user to enter a string:
	la $a0, user_prompt
	li $v0, 4
	syscall
	## Read the string, plus a terminator, into the buffer
	la $a0, buffer
	li $a1, 1024
	li $v0, 8
	syscall
	
	la $t1, buffer # lower array pointer = array base
	la $t2, buffer # start upper pointer at beginning
	LengthLp:
	lb $t3, ($t2) # grab the character at upper ptr
	beqz $t3, LengthDn # if $t3 == 0, we're at the terminator
	addi $t2, $t2, 1 # count the character
	b LengthLp # repeat the loop
	LengthDn:
	addi $t2, $t2, -2 # move upper pointer back to last char
	
	TestLp:
	bge $t1, $t2, Yes # if lower pointer >= upper pointer, yes
	lb $t3, ($t1) # grab the character at lower ptr
	lb $t4, ($t2) # grab the character at upper pointer
	bne $t3, $t4, No # if different, it's not a palindrome
	addi $t1, $t1, 1 # increment lower ptr
	subi $t2, $t2, 1 # decrement upper ptr
	b TestLp # restart the loop
	
	Yes:
	la $a0, is_palindrome_msg # print confirmation
	li $v0, 4
	syscall
	b exit
	No:
	la $a0, is_not_palindrome_msg # print denial
	li $v0, 4
	syscall