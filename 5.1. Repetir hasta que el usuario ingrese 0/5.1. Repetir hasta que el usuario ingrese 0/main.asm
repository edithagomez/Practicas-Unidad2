; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Repetir hasta que el usuario ingrese 0
; Descripción: ciclo condicional (similar a un do-while) que solicita ingresar un numero hasta que el numero sea 0

INCLUDE Irvine32.inc

.data
	mensaje BYTE "Ingrese un numero (0 para salir): ", 0

.code
main PROC

ciclo:	
	; imprime mensaje
	mov edx, OFFSET mensaje
	call WriteString
	
	call ReadInt ; lee lo que el usuario ingresó
	call crlf ; salta de linea

	cmp eax, 0 ; compara con 0
	jne ciclo ; si no es igual salta a ciclo

	; si si es igual
	exit ; termina

main ENDP

END main
