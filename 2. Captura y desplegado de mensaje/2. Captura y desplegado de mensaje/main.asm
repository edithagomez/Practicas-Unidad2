; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Captura y desplegado de mensaje
; Descripción: Captura una cadena de texto ingresada por el usuario 
; (máximo 15 caracteres) para guardarla en un arreglo y desplegarla de vuelta

INCLUDE Irvine32.inc

.data
	mensaje BYTE "Escribe tu nombre: ", 0 ; 0 es para indicar que la cadena termina

	nombre BYTE 15 DUP(0) ; INICIALIZAMOS EL ARREGLO EN 0 PORQUE ES UN VALOR NULO

.code 
main PROC
	mov edx, OFFSET mensaje ; apuntamos a la direccion en donde esta mensaje
	call WriteString ; para desplegarlo
	
	mov edx, OFFSET nombre ; ahora la direccion de nombre
	mov ecx, SIZEOF nombre ;numero de caracteres disponibles

	call ReadString ; lee lo que ingreso el usuario
	call crlf ; salto de linea 

	mov edx, OFFSET nombre ; volvemos apuntar a la memoria en donde ya debe de haber algo
	call WriteString ; para desplegarlo
	call crlf ; salto de linea
	exit

main ENDP

END main
