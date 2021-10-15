.data
	pw: 	.asciiz "Clique em 1 para iniciar o boot: "
	msg: 	.asciiz "\nBoot Area Partition 1\n"
	msg1: 	.asciiz "\nBoot Area Partition 2\n"
	msg2: 	.asciiz "\nRPMB Partition\n"
	msg3:	.asciiz "\n#####Sistema operacional iniciou!#####"

.text
.globl liga
	liga:
	li $v0, 4 		# imprime uma string na tela 
	la $a0, pw		# registrador a0 recebe variavel pw
	syscall			# Executa chamando o kernel 
	
	li $v0, 5		# Recebe um inteiro
	syscall 		# Executa chamando o kernel 
	
	move $t0, $v0		# movendo o valor digiitado para registrador t0
	li $t1, 0		# Atribuindo valor 0 para t1 (Idx)
	beq  $t0, 1, boot	# Se valor for igual a 1 inicia boot
	syscall			# Executa chamando o kernel 
	
	boot:
	li $v0, 4		# imprime uma string na tela 
	la $a0, msg		# registrador a0 recebe variavel msg
	syscall 		# Executa chamando o kernel 
	
	add $t1, $t1, 1		# Realiza operação de soma em t1
	bgt $t1, 0, boot1  	# Se $t1 > 0, vai para boot1
	
	boot1:
	li $v0, 4		# imprime uma string na tela 
	la $a0, msg1		# registrador a0 recebe variavel msg1
	syscall 		# Executa chamando o kernel 
	
	add $t1, $t1, 1		# Realiza operação de soma em t1
	bgt $t1, 1, rpmb  	# Se $t1 > 1, vai para rpmb
	
	rpmb:
	li $v0, 4		# imprime uma string na tela 
	la $a0, msg2		# registrador a0 recebe variavel msg2
	syscall 		# Executa chamando o kernel 
	
	add $t1, $t1, 1		# Realiza operação de soma em t1
	bgt $t1, 2, sair  	# Se $t1 > 2, vai para fim
	
	sair:
	li $v0, 4		# imprime uma string na tela 
	la $a0, msg3		# registrador a0 recebe variavel msg3
	syscall			# Executa chamando o kernel
	
	li $v0, 10		# Pepara processador para finalizar o boot
	syscall			# Executa chamando o kernel 
	
	
	
	
	
	
