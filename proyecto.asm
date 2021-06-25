.data 
array: .space  80
arrayPrice: .space 20
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
product1: .asciiz "1) Huevo"
product2: .asciiz "2) Pan"
product3: .asciiz "3) Zanahoria"
product4: .asciiz "4) Libra de arroz"
product5: .asciiz "5) Libra de pollo"

texto: .space len

size:       .word   20
string:     .space  20000       # [NEW]
.text
.globl main
main:
	#guarda el array de productos
	la $s0,product1
	la $s1, product2
	la $s2, product3
	la $s3, product4
	la $s4, product5	
	#index
	addi $t0, $zero, 0
	addi $t1, $zero, 4
	addi $t2, $zero, 8
	addi $t3, $zero, 12
	addi $t4, $zero, 16

	
	sw $s0, array($t0)
	sw $s1, array($t1)
	sw $s2, array($t2)
	sw $s3, array($t3)
	sw $s4, array($t4)
	
	#guarda array de precios
	addi $s0, $zero, 15
	addi $s1, $zero, 15
	addi $s2, $zero, 10
	addi $s3, $zero, 40
	addi $s4, $zero, 140	
	#index
	addi $t0, $zero, 0
	addi $t1, $zero, 4
	addi $t2, $zero, 8
	addi $t3, $zero, 12
	addi $t4, $zero, 16

	
	sw $s0, arrayPrice($t0)
	sw $s1, arrayPrice($t1)
	sw $s2, arrayPrice($t2)
	sw $s3, arrayPrice($t3)
	sw $s4, arrayPrice($t4)

  
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
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	
    	#despliega los productos
    	li $v0, 4
    	lw $a0, array($t0)
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	li $v0, 4
    	lw $a0, array($t1)
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	li $v0, 4
    	lw $a0, array($t2)
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	li $v0, 4
    	lw $a0, array($t3)
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	li $v0, 4
    	lw $a0, array($t4)
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	
   
    	#En este apartado deberíamos presentar todos los productos disponibles para eso
    	#deberiamos leer un txt con todos los productos y su respectivo producto.
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	jal compras
    	move $t0,$v0
    	li $v0, 4
    	la $a0, titulo3
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	li $v0, 1
    	move $a0,$t0
    	syscall
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	j salir
compras:
	addi $s5,$zero,0	#registro que guardará el total
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
    		move $t0,$v0 	#se guarda el código del producto en to (indice)
    		#presenta Ingrese la cantidad a comprar:  
    		li $v0, 4
    		la $a0, titulo7
    		syscall
    		li $v0,5
    		la $a0, texto
    		li $a1, len
    		syscall
    		move $t1,$v0 	#se guarda la cantidad en t1 
    		
    		#Despues que se muestre este mensaje ya debería calcular el pago
    		add $t2,$t0,-1 		#indice -1 debido a que empieza el array desde 0.
    		add $t3, $zero,4 	#t3 guarda 4 para la posición de los 4 bits de los arrays
    		mul $t4,$t2,$t3		#se multiplica el indice por t3 para obtener la dirección del data
    		lw $t5, arrayPrice($t4) #obtenemos el precio
    		mul $t5, $t5, $t1
    		add $s5, $s5, $t5
    		
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
    		move $v0, $s5
    		jr $ra 
salir:
	#Sale del programa
	li $v0, 4
    	la $a0, titulo4
    	syscall
