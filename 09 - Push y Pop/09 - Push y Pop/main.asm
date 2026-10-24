; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Push y pop
; Descripción: Programa que demuestra el uso de la memoria de la pila

INCLUDE Irvine32.inc
.data
.code 
main PROC
	; BLOQUE 1: PUSH Y POP
	mov eax, 500
	push eax ; empujamos eax a la cima de la pila
	nop

	mov ebx, 0
	pop ebx ; saca lo que habia en la cima y lo guarda en ebx
	nop

	; BLOQUE 2: ORDEN LIFO
	mov eax, 10
	push eax ; metemos 10

	mov eax, 20
	push eax ; ahora 20

	mov eax, 30
	push eax ; ahora 30 

	nop

	pop eax ; sacamos el ultimo que entro y asi sucesivamente
	pop ebx
	pop ecx

	nop
	
	; BLOQUE 3: CONSERVAR REGISTROS
	mov eax, 100
	mov ebx, 200

	push eax
	push ebx

	mov eax, 999 ; asignamos valores basura
	mov ebx, 888

	pop ebx ; restauramos los valores que tenian sacandolos de la pila 
	pop eax

	; BLOQUE 4: CALL Y RET
	mov eax, 50
	mov ebx, 666 ; valor que no tenemos que perder

	call aumentarDiez ; llama al procedimiento mencionado

	nop

	exit

main ENDP

aumentarDiez PROC
	nop 
	push ebx ; metemos a la pila el valor importante

	nop

	mov ebx, 10 ; usamos ebx sin problema
	add eax, ebx

	nop

	pop ebx ; recuperamos el valor importante sacandolo de la pila

	nop

	ret ; return, le dice que ya termino

aumentarDiez ENDP

END main
