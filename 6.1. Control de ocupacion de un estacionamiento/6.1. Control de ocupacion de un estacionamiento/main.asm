; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Control de ocupacion de un estacionamiento
; Descripción: Programa que simula el sistema de control de un estacionamiento

INCLUDE Irvine32.inc

.data
	msgMax BYTE "Estacionamiento lleno", 13, 10, 0
	msgMenu BYTE "1. Entrar carro. 2. Salir carro. 0. Cerrar. Opcion: ", 0
	msgActual BYTE "Carros en estacionamiento: ", 0
	msgVacio BYTE "El estacionamiento ya esta vacio.", 13, 10, 0 
	; el 13, 10 representa CR (Carriage Return) y LF (Line Feed)

.code
main PROC
	mov ebx, 20 ; limite de carros 
	mov ecx, 0  ; numero de carros actuales en el estacionamiento

menu:
	mov edx, OFFSET msgActual ; imprime mensaje 
	call WriteString
	mov eax, ecx ; copiamos el valor de ecx a eax para imprimir el numero 
	call WriteDec
	call crlf

	mov edx, OFFSET msgMenu ; imprime mensaje
	call WriteString
	call ReadInt ; lee el numero ingresado por el usuario
	call crlf
	
	cmp eax, 0 ; compara
	je fin ; si es igual a 0 se va a fin y termina

	cmp eax, 1
	je entro ; si es igual a 1 se va a entro

	cmp eax, 2 ; si es igual a 2 se va a salio
	je salio
	
	jmp menu ; salto incondicional para repetir

entro:
	cmp ecx, ebx ; compara con el limite de carros       
	jge maximo ; si es mayor o igual salta a maximo
	
	inc ecx ; si no incrementa 1 y vuelve al menu            
	jmp menu

salio:
	cmp ecx, 0 ; comparamos con el num de carros actuales         
	je vacio ; si hay 0 salta a vacio      

	dec ecx ; si no decrementa 1           
	jmp menu ; salto incondicional para repetir

vacio:
	mov edx, OFFSET msgVacio ; imprime mensaje de vacio
	call WriteString
	jmp menu ; salto incondicional para repetir

maximo:
	mov edx, OFFSET msgMax ; imprime mensaje de lleno
	call WriteString
	jmp menu ; salto incondicional para repetir

fin:
	exit ;termina

main ENDP

END main
