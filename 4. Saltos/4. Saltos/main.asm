; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Saltos
; Descripción: Compara dos números y utiliza saltos condicionales (JE) e incondicionales (JMP) 
; e imprime si los valores son iguales o diferentes.

INCLUDE Irvine32.inc

.data
	; declaramos mensajes 
	msgIguales BYTE "Los valores son iguales", 0
	msgDiferentes BYTE "Los valores son diferentes", 0

.code 
main PROC
	mov eax, 10
	mov ebx, 10

	cmp eax, ebx ; comparamos

	je iguales ; si son iguales salta hacia iguales y omite lo que esta antes

	mov edx, OFFSET msgDiferentes ; si no son iguales sigue con el codigo e imprime este mensaje 
	call WriteString ; desplegamos

	jmp fin ; salta hacia fin sin ninguna condicion

iguales: ; si son iguales se despliega el mensaje iguales que declaramos 
	mov edx, OFFSET msgIguales
	call WriteString

fin:
	call crlf ; salta de linea y termina
	exit 

main ENDP

END main
