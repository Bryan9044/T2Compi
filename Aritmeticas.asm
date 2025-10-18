.data

#Quiero representar una operacion tipo ((5+4) > (9*10)) or ((7==7) <= (54-3))

#Estas vendrían a ser las variables en el programa
	num1: .word 5
	num2: .word 4
	num3: .word 9
	num4: .word 10
	num5: .word 7
	num6: .word 7
	num7: .word 54
	num8: .word 3

# strings para los resultados
	suma: .asciiz"Resultado de la suma "
	multi: .asciiz"Resultado de la multiplicacion "
	mayor: .asciiz"Resultado de 9 > 90: "
	igual: .asciiz"Resultado de 7==7: "
	resta: .asciiz"Resultado de la resta 54-3: "
	menorIgual: .asciiz"Resultado (7==7 <= 51): "
	resultadoOR: .asciiz"Resultado del OR: "


.text
	#Lo declaramos global para que pueda ser utilizado por cualquier archivo
	.globl main
	
	main:
		lw $t0, num1 # Cargo el valor de mi variable en el registro $t0
		lw $t1, num2 # Cargo el valor de mi variable en el registro $t1
		lw $t2, num3 # Cargo el valor de mi variable en el registro $t2
		lw $t3, num4 # Cargo el valor de mi variable en el registro $t3
		lw $t4, num5 # Cargo el valor de mi variable en el registro $t4
		lw $t5, num6 # Cargo el valor de mi variable en el registro $t5
		
		add $t6, $t0, $t1 #Realizo una suma entre $t0 y $t1, guardo su valor en el registro $t6
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, suma # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1 # En el registro para mostrar le pasamos un 1 porque es un entero 
		move $a0, $t6 #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall
		
		mul $t7, $t2,$t3  #Realizo una multiplicacion entre $t2 y $t3, guardo su valor en el registro $t7
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, multi # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1 # Le decimos al registro que queremos mostrar un entero por eso el 1
		move $a0, $t7 #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall		
	
		
	
		
		sgt $t0,$t6, $t7  #Compara si $t6 es mayor a $t7
		
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, mayor # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1 # Le decimos al registro que queremos mostrar un entero por eso el 1
		move $a0, $t0 #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall		
	
		
		
		seq $t1, $t4, $t5 #Comparo ti $t4 y $t5 son iguales si es así se guarda un 1 en $t1 sino un 0
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, igual # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1 # Le decimos al registro que queremos mostrar un entero por eso el 1
		move $a0, $t1 #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall	
		
		
		lw $t4, num7 #Cargo la variable en el registro $t4
		lw $t5, num8 #Cargo la variable en el registro $t5
		sub $t2, $t4, $t5 #Realizo una resta entre el registro $t4 y $t5 esta se guarda en $t2
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, resta # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1 # Le decimos al registro que queremos mostrar un entero por eso el 1
		move $a0, $t2  #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall	
		
		sle $t3, $t1, $t2 #Comparo si el registro $t1 es menor e igual a $t2 si es así se guarda un 1 en $t3 sino 0
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, menorIgual # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1 # Le decimos al registro que queremos mostrar un entero por eso el 1
		move $a0, $t3 #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall	
		
		
		or $t1, $t0, $t3 #Revisa cual de las dos registros tiene un 1 si alguno lo tiene entonces en $t1 se guarda si ninguno tiene 1 
		#entonces 0
		
		
		li $v0, 4 # En el registro para mostrar le pasamos un 4 porque es un string
		la $a0, resultadoOR # Cargamos en el registro #$a0 que muestra la variable 
		syscall
		
		li $v0, 1  # Le decimos al registro que queremos mostrar un entero por eso el 1
		move $a0, $t1 #Enviamos al registro $a0 que muestra el valor entero que le pasa nuestro otro registro
		syscall  
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall	
		
		move $a0, $t1  # Movemos al registro para mostrar enteros
		li $v0, 1 #Cargamos en el registro $v0 y le damos un 1 porque quermeos mostrar un entero
		syscall # llamada al sistema
		
		li $v0, 10 # Llamada al sistema para que sepa cuando terminar todo el programa
		syscall 
		
		