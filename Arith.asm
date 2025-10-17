.data

#Aquí me gustaría hacer un ejemplo tipo 25+15.2*4/3.4


	x: .word 4
	z: .word 25
	y: .float 3.4
	w: .float 15.2
	cambiof: .float 33.5


	# Para las relacionales
	
	#ejemplo de una relacional 3<2 == 4>1.2
	ra: .word 3
	ra1: .word 2
	ra2: .word 4
	raf: .float 1.2
	

.text
	.globl main
	
	main: 
		li $t0, 3
		li $t1, 4
		mul $t2, $t0, $t1    # t2 = 3*4 = 12

		li $t3, 2
		div $t2, $t3
		mflo $t4             # t4 = 12 / 2 = 6

		li $t5, 5
		add $t6, $t4, $t5    # t6 = 6 + 5 = 11

		li $t0, 4
		sub $t7, $t6, $t0    # t7 = 11 - 4 = 7


		move $a0, $t7
		li $v0, 1
		syscall
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall
		
		jal multiArith
		
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall
		
		jal reasignarvalInt
		
		li $a0, 10 #Esto es para el salto de linea
		li $v0, 11
		syscall
		
		jal multiRelationalB
		
			
		
		li $v0, 10
		syscall

	multiArith:	
		lw $t0, x #este es 4
		mtc1 $t0, $f1 
		cvt.s.w $f1, $f1
		
		lw $t1, z # este es 25
		mtc1 $t1, $f2
		cvt.s.w $f2,$f2
		l.s $f3, y # este es 3.4
		l.s $f4, w # este es 15.2
		
		
		mul.s $f5, $f4, $f1 #esto deberia dar 60,8
		div.s $f6, $f5, $f3 #esto deberia dar  17,......
		add.s $f0, $f6, $f2 # esto deberi dar 42.....
		
		mov.s $f12, $f0
		li $v0, 2
		li $a0, 10

		syscall 
		
		jr $ra
		
	reasignarvalInt:
		li $t1, 75
		sw $t1, x
		
		lw $a0, x
		li $v0, 1
		
		syscall
		
		jr $ra
		
	reasignarValFloat:
		l.s  $f1, cambiof
		swc1 $f1, y
		
		l.s $f12, y
		li $v0, 2
		
		syscall
		
		jr $ra 
		
	multiRelationalB:
		lw $t0, ra2 #aqui ta 4
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1 #Aqui ya es 4.0 o sea float
		
		l.s $f2, raf #Cargo 1.2
		
		lw $t1, ra #cargamos 3
		lw $t2, ra1 # cargamos 2
		slt $t3,$t2, $t1 #Aqui hago 2<3 si es velda t3 = 1 sino 0
		##Esto es para comprobar
		move $a0, $t3
		li $v0, 1
		syscall 
		##Esto es para comprobar
		
		c.lt.s $f2, $f1 #Aqui hago 4 > 1.2  y me pone una bandera
		bc1t esVerdad 
		li $t5, 0
		move $a0, $t5
		li $v0, 1
		syscall 
		
		jr $ra

		 
	esVerdad:
		li $t5, 1 #Aqui digo que si fue verdad la op relacional
		seq $t4, $t3, $t5
			

		move $a0, $t4
		li $v0, 1
		syscall
		jr $ra
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
	