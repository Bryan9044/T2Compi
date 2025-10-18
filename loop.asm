.data 
    strBucle: .asciiz "\nEntre al bucle."
    strSalir: .asciiz "\nSalí del bucle."
.text 

.globl main
	
main: 
    #Instrucciones previas al loop 
    li $t0, 0  #Cargo un 0 en $t0 
    li $t1, 0  #Cargo un 0 en $t1
    li $t2, 5  #Cargo un 5 en $t2 para salir del bucle 
loop:

    #Impresión para ir viendo el flujo
    li $v0, 4 #Código para imprimir string 
    la $a0, strBucle #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 


    addi $t1, $t0, 1 #Sumo 1 al registro $t0 y lo guardo en $t1 
    move $t0, $t1 #Mover el valor de $t1 a $t1 

    #Se debe hacer un salto condicional para saber si continuar en el bucle o salgo. En este caso por ejemplo que $t0 sea 5
    beq $t0, $t2, finloop #Salta a finloop si el registro $t0 ya llegó a 5
    b loop #Salto sin condición al principio del bucle para continuar iterando si no hizo el salto anterior  

finloop:
    li $v0, 4 #Código para imprimir string 
    la $a0, strSalir #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 


    #Salgo del programa ya que completé el bucle 
    li $v0, 10 #Exit 
    syscall #Para ya salir del programa 



