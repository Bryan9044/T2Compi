.data 
    strElse: .asciiz "Entre en else."
    strPrimeraCondicion: .asciiz "Entre en la primera condicion." 
    strSegundaCondicion: .asciiz "Entre en la segunda condicion." 
    strSalir: .asciiz "Voy a salir."

.text 
.globl main 

main: 
    
    li $t0, 10 #Primer valor para comparar 
    li $t1, 20 #Segundo valor para comparar 
    li $t2, 5 #Tercer valor para comparar 

    #Primera condición. Si $t0 > $t1 
    bgt $t0, $t1, primeraCondicion 

    #Segunda condición. Si $t0 > $t2 
    bgt $t0, $t2, segundaCondicion

    #Esto se podría repetir las veces que queramos para a modo de if-elif con todas las condiciones necesarias
    
    #Ahora con la parte del else. Se ejecuta de forma incondicional. Puede quedarse aquí o hacer una etiqueta con salto sin condición, eso ya es decisión de quien lo programe
    li $v0, 4 #Código para imprimir string 
    la $a0, strElse #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 

    b salir

primeraCondicion: 
    #Aquí haría todo lo de la primera condición

    li $v0, 4 #Código para imprimir string 
    la $a0, strPrimeraCondicion #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 

    b salir



segundaCondicion: 
    #Aquí haría todo lo de la primera condición

    li $v0, 4 #Código para imprimir string 
    la $a0, strSegundaCondicion #Mover a ese registro la dirección de memoria del string a imprimir 
    syscall #Hacer la llamada 

    b salir

    

salir:
    #En este ejemplo aquí vienen todos los códigos y es lo que se haría después de ejecutar el código de la condición
    li $v0, 4 
    la $a0, strSalir 
    syscall 

    li $v0, 10 #Exit 
    syscall #Para ya salir del programa 