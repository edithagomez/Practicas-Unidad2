; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Ciclos númericos
; Descripción: Realiza una cuenta regresiva del 5 al 1, imprimiendo cada número en una 
; nueva línea mediante el uso de la instrucción LOOP y el registro ECX como contador.

INCLUDE Irvine32.inc
.data
.code
main PROC
	mov ecx, 5 ; contador

ciclo:
	mov eax, ecx ; copiamos el valor de ecx para imprimir el numero
	call WriteDec ; imprime numeros
	call crlf ; salto de linea

	loop ciclo ; decrementa ecx, si no es 0 se vuelve a repetir ciclo
	
	exit

main ENDP
END main
