.data

#Quiero representar una operacion tipo ((5+4) > (9*10)) or ((7==7) <= (54-3))

	num1: .word 5
	num2: .word 4
	num3: .word 9
	num4: .word 10
	num5: .word 7
	num6: .word 7
	num7: .word 54
	num8: .word 3



.text

	.globl main
	
	main:
		lw $t0, num1
		lw $t1, num2
		lw $t2, num3
		lw $t3, num4
		lw $t4, num5
		lw $t5, num6
		
		add $t6, $t0, $t1
		mul $t7, $t2,$t3
		
		sgt $t0,$t6, $t7
		
		seq $t1, $t4, $t5
		lw $t4, num7
		lw $t5, num8
		sub $t2, $t4, $t5
		
		sle $t3, $t1, $t2
		
		or $t1, $t0, $t3
		
		move $a0, $t1
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		
		