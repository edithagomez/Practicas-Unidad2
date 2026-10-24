; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Comparación y prueba
; Descripción: Programa que demuestra cómo cambian las banderas

INCLUDE Irvine32.inc

.code 
main PROC
	; CONDICION: ZERO FLAG 
	mov EBX, 1 ; ebx = 1
	cmp ebx, 1 ; compara ebx con 1 y como es igual se enciende ZF
	call dumpRegs ; imprime los registros y banderas para comprobar

	mov EAX, 01h ; 01h en decimal es 1 asi que da lo mismo
	cmp EAX, EBX ; compara y ZF = 1
	call dumpRegs ; imprime los registros y banderas para comprobar

	mov cl, 11111111b ; se le da un valor binario a cl
	cmp cl, cl ; se compara a sí mismo y da lo mismo
	call dumpRegs 

	; CONDICION 2: SING  FLAG
	; limpiar registros
	mov EAX, 0 
	mov EBX, 0 

	; asignamos valores
	mov al, -5 
	mov bl, 1

	cmp al, bl ; comparamos de nuevo y como es negativo se enciende SF
	call dumpRegs 

	; CONDICION 3: CARRY FLAG
	; limpiamos de nuevo
	mov EAX, 0
	mov EBX, 0
	
	mov al, 255 ; asignamos 
	add al, 1 ; le sumamos 1 y como el maximo en 8 bits es 255 y quiere guardar 256, se enciende CF y dejamos en 0 a al

	call dumpRegs 

	; CONDICION 4: OVERFLOW FLAG
	; limpiamos
	mov EAX, 0
	mov EBX, 0
	; asignamos valores
	mov al, -128
	mov bl, 1
	cmp al, bl ; - 128 - 1 = -129, son 8 bits asi que no cabe el -128 y se enciende OF 
	call dumpRegs 

	; CONDICION 5: TEST

	mov EAX, 0
	mov EAX, 5 ; = 00000101b
	test EAX, 1 ; test verifica bits pero no cambia valores, solo actualiza banderas
	; ej. visual
	; 00000101b el 5
	;------------
	; 00000001b el 1
	;------------
	; 00000001b como lo ve test

	mov eax, 0
	mov al, 10000000b
	test al, al
	call dumpRegs ; revisa solo el último bit de la derecha y como el 5 es impar, 
	; el resultado de la prueba no es cero, así que la Zero Flag no se activa.

	exit

main ENDP

END main
