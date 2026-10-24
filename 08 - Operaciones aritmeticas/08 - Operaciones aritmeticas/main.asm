; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Operaciones aritmeticas
; Descripción: Demuestra el uso de las instrucciones aritméticas básicas

INCLUDE Irvine32.inc

.code 
main PROC
	; OPERACIONES: ADD Y SUB
	mov eax, 50
	mov ebx, 20

	add eax, ebx ; suma y guarda el resultado en eax, 50+20=70
	sub eax, 15 ; resta y guarda el resultado en eax, 70-15=55

	nop ; significa que no hay ninguna operacion 

	; 2. CF: ACARREO EN UNA SUMA SIN SIGNO
	mov eax, 0 ; limpiamos eax
	mov al, 255 ; 255 es el limite
	add al, 1 ; cuando le sumamos 1 no cabe en al por sus 8 bits, entonces queda en 0 y se enciende CF

	nop ; es como un break en un switch

	; 3. OF: CONDICION DE DESBORDAMIENTO
	mov eax, 0 ; limpiamos eax
	mov al, 127 ; 127 es el numero positivo mas grande que cabe en 8 bits con signo
	add al, 1 ; al sumar 1 se convierte en -128, como positivo mas positivo resulto un negativo se enciende OF

	nop

	; 4. MUL: MULTIPLICACION DE VALORES DENTRO DE 32 BITS
	mov eax, 25 ; mul siempre multiplica lo que hay en eax
	mov ebx, 3

	mul ebx ; multiplica 25 * 3 y el resultado se guarda en eax

	nop

	; 5. MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS
	mov eax, 65537
	mov ebx, 65537

	mul ebx ; multiplicamos un numero muy grande, y como no cabe en eax el valor se comparte con edx
	; el valor mas grande queda en edx

	nop

	; 6. IMUL: MULTIPLICACION CON SIGNO
	mov eax, -5

	imul eax, eax, 3 ; aqui seria como la multiplicacion tradicional eax = eax * 3

	nop

	; 7. DIV: DIVISION SIN SIGNO
	mov eax, 125 ; el dividendo va en eax
	mov edx, 0 ; nos da el residuo
	mov ebx, 12 ; divisor

	div ebx

	nop

	; IDIV: DIVISION CON SIGNO
	mov eax, -125

	cdq ; rellena a edx con el signo correcto

	mov ebx, 12

	idiv ebx ; eax se queda con el cociente y edx el residuo

	exit

main ENDP

END main
