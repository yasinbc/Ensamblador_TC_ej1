#En el dominio de .data se declaran las variables que se van a usar y se les asigna un valor, ya sean int, str, float...
.data
	#varibale de tipo string
	message: .asciiz "Ejercicio de Bifurcación. Salida del programa --> "
	
#Cuerpo del programa donde se ejecuta la logica
.text
main:
	#Imprime el mensaje (message)
	li $v0, 4 	 #carga en memoria el tipo de dato STRING
	la $a0, message  #carga en memoria la variable del tipo STRING que contiene el mensaje
	syscall  	 #imprime lo que hay en memoria por la consola
        
	#Carga en $a0 el valor 6 de tipo entero
	li $a0, 6
	
	#Salta a "funcion" 
	jal funcion
	
	#Copia el valor $v0(16) en $a0
	move $a0, $v0
	
	#Imprime el entero que esta en $v0(16)
	li $v0, 1
	syscall #Este syscall imprime un 16

	#Finaliza el programa	
	li $v0, 10
	syscall

#Declara una funcion con el nombre "funcion"
funcion: 	li $t0, 10 #Carga en $t0 el valor 10

		 #Compara si $a0 es mayor que $t0 si es asi salta a et1, de lo contrario entra y vuelve a poner en $t0 el valor 10 
		 bgt $a0, $t0, et1 # EQUIVALENTE A if(a0 > t0)
		 
		 #Carga en $t0 el valor de tipo entero = 10, en caso de que a0 < t0
		 li $t0, 10
		 
		 #Suma $t0(10) + $a0(6) y añade el resultado a $v0 = 16
		 add $v0, $t0, $a0
		 
		 #Hace un salto a la etiqueta et2
		 b et2
		 
		 #Entra en et1 si el valor de $a0 > $t0 pone $t0 con valor de tipo entero = 8
		 et1: li $t0, 8
		 
		 #Suma el valor de $t0 + $a0 y añade el resultado a $v0
		 add $v0, $t0, $a0
		 
		 #Sale de la función y vuelve al programa inicial al punto donde lo dejo
		 et2: jr $ra
