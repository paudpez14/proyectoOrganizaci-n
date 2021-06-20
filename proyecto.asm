.data 
.eqv len 10
titulo: .asciiz "Bienvenido a MiniMarket ESPOL"
titulo2: .asciiz "Lista de Productos Disponibles"
titulo3: .asciiz "Total a Pagar:  "
titulo4: .asciiz "Gracias por su Compra."
titulo5: .asciiz "Opción Incorrecta. Ingrese de nuevo"
newLine: .asciiz "\n"
texto: .space len
.text

.globl proyecto
proyecto:
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
    	li $v0, 4
    	la $a0, titulo4
    	syscall
	jal compras