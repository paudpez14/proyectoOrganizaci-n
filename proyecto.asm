.data 
.eqv len 10
titulo: .asciiz "Bienvenido a MiniMarket ESPOL"
titulo2: .asciiz "Lista de Productos Disponibles"
titulo3: .asciiz "Total a Pagar:  "
titulo4: .asciiz "Gracias por su Compra."
titulo5: .asciiz "Opción Incorrecta. Ingrese de nuevo"
titulo6: .asciiz "Ingrese el codigo del producto:  "
titulo7: .asciiz "Ingrese la cantidad a comprar:  "
titulo8: .asciiz "¿Desea continuar? Si[1] No[2]:  "
newLine: .asciiz "\n"
texto: .space len
.text
.globl main
main:
	#presenta Bienvenido a MiniMarket ESPOL
	li $v0, 4
    	la $a0, titulo
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	#presenta Lista de Productos Disponibles
    	li $v0, 4
    	la $a0, titulo2
    	syscall
    	#En este apartado deberíamos presentar todos los productos disponibles para eso
    	#deberiamos leer un txt con todos los productos y su respectivo producto.
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	jal compras
    	li $v0, 4
    	la $a0, titulo3
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	j salir
compras:
	addi $sp,$sp,-4
   	sw $ra,($sp)
   	addi $t0, $zero, 1
   	validacion:
	   	beq $t0, 2, salida
		#presenta Ingrese el codigo del producto:  
    		li $v0, 4
    		la $a0, titulo6
    		syscall
    		li $v0,5
    		la $a0, texto
    		li $a1, len
    		syscall
    		#presenta Ingrese la cantidad a comprar:  
    		li $v0, 4
    		la $a0, titulo7
    		syscall
    		li $v0,5
    		la $a0, texto
    		li $a1, len
    		syscall
    		#Despues que se muestre este mensaje ya debería calcular el pago
    		#presenta ¿Desea continuar? Si[1] No[2]:  
    		#Validado el 1 y el  2	
    		li $v0, 4
    		la $a0, titulo8
    		syscall
    		li $v0,5
    		la $a0, texto
    		li $a1, len
    		syscall
    		move $t0, $v0
    		j validacion    		
    	salida: 
    		#sale de la funcion
    		lw $ra, ($sp)
    		addi $sp,$sp,4
    		jr $ra 
salir:
	#Sale del programa
	li $v0, 4
    	la $a0, titulo4
    	syscall
