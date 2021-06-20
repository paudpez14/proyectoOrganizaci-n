.data 
.eqv len 10
titulo: .asciiz "Ingrese el codigo del producto:  "
titulo2: .asciiz "Ingrese la cantidad a comprar:  "
titulo3: .asciiz "¿Desea continuar? Si[1] No[2]:  "
newLine: .asciiz "\n"
texto: .space len
.text
.globl compras
compras:
	addi $sp,$sp,-4
   	sw $ra,($sp)
	#presenta Ingrese el codigo del producto:  
    	li $v0, 4
    	la $a0, titulo
    	syscall
    	li $v0,5
    	la $a0, texto
    	li $a1, len
    	syscall
    	#presenta Ingrese la cantidad a comprar:  
    	li $v0, 4
    	la $a0, titulo2
    	syscall
    	li $v0,5
    	la $a0, texto
    	li $a1, len
    	syscall
    	#Despues que se muestre este mensaje ya debería calcular el pago
    	#presenta ¿Desea continuar? Si[1] No[2]:  
    	#Validar el 1 y el  2	
    	li $v0, 4
    	la $a0, titulo3
    	syscall
    	li $v0,5
    	la $a0, texto
    	li $a1, len
    	syscall 
    	lw $ra, ($sp)
    	addi $sp,$sp,4
    	jr $ra 
 