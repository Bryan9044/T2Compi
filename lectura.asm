.data 
    strEntrada: .asciiz "\nIngrese un entero: "
    strSalida: .asciiz "\nEl valor que ingreso fue: "
.text 

.globl main

main:
    #Imprimir el texto 
    li $v0, 4 #Código para imprimir string 
    la $a0, strEntrada #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 

    #Llamada para leer el número
    li $v0, 5
    syscall

    #Guardar el valor en un registro 
    move $t0, $v0

    #Imprimir el valor 
    li $v0, 4 #Código para imprimir string 
    la $a0, strSalida #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 

    li $v0, 1 #Código para imprimir string 
    move $a0, $t0
    syscall #Hacer la llamada 

    #Salir del programa
    li $v0, 10 #Exit 
    syscall #Para ya salir del programa  




