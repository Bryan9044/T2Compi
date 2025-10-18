.data 
    strBucle: .asciiz "\nEntre al bucle for."
    strSalir: .asciiz "\nSalí del bucle for."
.text 

.globl main

main:
    #Se prepara el registro que hará a modo de iterador 
    li $t0, 0  #Cargo un 0 en $t0 para usarlo de iterador 
    li $t1, 5  #Cargo un 5 en $t1
    li $t2, 0  #Cargo un 0 en $t2

for: 
    #En esta estructura hago la comparación al principio. En este caso que el iterador llegue hasta 5 
    beq $t0, $t1, finFor #Salta a finloop si el registro $t0 ya llegó a 5 comparando con el registro $t1 

    #Si no se cumple la condición, se ejecuta el bloque de codigo correspondiente 
    #Impresión para ir viendo el flujo
    li $v0, 4 #Código para imprimir string 
    la $a0, strBucle #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 

    #Aumento el iterador el valor fijo correspondiente sea suma o resta 
    addi $t2, $t0, 1
    move $t0, $t2 #Mover el valor de $t2 a $t0 ya que este era el registro original 

    #Me devuelvo al principio del for sin deber de cumplir ninguna restricción para este salto 
    b for 

finFor: 
    #Codigo que se ejecuta al finalizar el ciclo for 

    li $v0, 4 #Código para imprimir string 
    la $a0, strSalir #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 


    #Salgo del programa ya que completé el bucle 
    li $v0, 10 #Exit 
    syscall #Para ya salir del programa  