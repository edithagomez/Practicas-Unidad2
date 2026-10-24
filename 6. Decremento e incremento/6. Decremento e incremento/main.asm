; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Decremento e incremento
; Descripción: Programa que simula un sistema de seguridad para validar un PIN

INCLUDE Irvine32.inc

.data
	; declaramos mensajes
	msgPIN BYTE "Ingrese el PIN: ", 0
	msgIntentos BYTE "Intentos restantes: ", 0
	msgError BYTE "PIN incorrecto.", 0
	msgAcceso BYTE "Acceso permitido.", 0
	msgBloqueado BYTE "Autodestruccioin comenzada...", 0

	pinCorrecto = 1234

.code 
main PROC
	
	mov ebx, 3 ; numero de intentos para ingresar 

intentar: 
	mov edx, OFFSET msgPIN
	call WriteString
	call ReadInt ; se lee msgPIN y se guarda en eax 

	cmp eax, pinCorrecto ; comparamos 
	je acceso ; si es igual salta a acceso

	mov edx, OFFSET msgError
	call WriteString ; muestra el mensaje de error
	call crlf ; salto de linea
	
	dec ebx ; ebx-- resta 1 intento

	jz bloqueado ; si es 0 se va a bloqueado
	
	; si no es 0 sigue 
	mov edx, OFFSET msgIntentos ; imprime mensaje de intentos restantes
	call WriteString

	mov eax, ebx
	call WriteDec ; y aqui nos dice cuantos intentos nos quedan, el numero como tal
	call crlf

	jmp intentar ; salta sin condicion a intentar

acceso:
	mov edx, OFFSET msgAcceso
	call WriteString
	call crlf
	jmp fin ; muestra que accedio y salta sin condicion a fin

bloqueado: 
	mov edx, OFFSET msgBloqueado ; se muestra el mensaje de bloqueado y se va a fin
	call WriteString
	call crlf
	jmp fin
fin: 
	exit ; termina

main ENDP

END main
