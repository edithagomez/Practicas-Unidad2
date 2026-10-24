; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Condicionales
; Descripción: Imprime en pantalla los números del 1 al 10 en orden ascendente

INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ebx, 1 ; inicializamos
	
ciclo:
	cmp ebx, 10 ; comparamos con el limite
	jg fin ; salta si es mayor de 10 en este caso (porque lo comparamos con 10)
	
	; si no es mayor sigue
	mov eax, ebx ; copiamos el valor a eax 
	call WriteDec ; imprimimos
	call crlf  

	inc ebx ; ebx++ incrementa 1 a ebx 

	jmp ciclo ; salta sin condicion para repetir el codigo
	
fin:
	exit ; termina

main ENDP

END main
