; Materia: Lenguajes de interfaz
; Alumno(a): Gómez Sánchez Edith Alessandra
; Hora: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Mayor, menor o igual con entrada del usuario
; Descripción: Solicita dos números al usuario, los compara y utiliza saltos condicionales (JE, JGE) 
; para determinar y mostrar en pantalla si son mayor, menor o igual

INCLUDE Irvine32.inc 

.data
    ; declaramos mensajes
    numero1 BYTE "Escribe el primer numero: ", 0
    numero2 BYTE "Escribe el segundo numero: ", 0

    msgDiferentes BYTE "Los numeros son diferentes.", 0
    msgMenor BYTE "El primer numero es menor.", 0
    msgIguales BYTE "Los numeros son iguales.", 0
    msgEsmayoroigual BYTE "El primer numero es mayor.", 0

.code
main PROC
    ; pedimos el numero1 desplegando el mensaje 
    mov edx, OFFSET numero1
    call WriteString

    call ReadInt ; leemos el numero escrito por el usuario

    mov ecx, eax ; guardamos en ecx

    ; pedimos el numero2 desplegando el mensaje 
    mov edx, OFFSET numero2
    call WriteString

    call ReadInt ; leemos el otro numero escrito por el usuario

    mov ebx, eax ; guardamos en ebx

    ; copiamos el primer numero a eax para compararlo con ebx
    mov eax, ecx ;
    cmp eax, ebx
  
    ; si son iguales, salta a la etiqueta iguales
    je iguales
    
    ; si no es que son diferentes y sigue con el codigo y muestra el mensaje de que son diferentes
    mov edx, OFFSET msgDiferentes
    call WriteString
   
    jge mayor ; si el primero es mayor, saltamos a la etiqueta mayor
    ; JGE verifica si es mayor o igual, pero como ya descartamos la igualdad, solo queda si es mayor

    ; si no es mayor sigue e imprime que es menor
    mov edx, OFFSET msgMenor
    call WriteString

    jmp fin ; salta a fin sin condicion alguna

iguales: ; despliega mensaje de que son iguales
    mov edx, OFFSET msgIguales
    call WriteString
  
    jmp fin ; salta a fin sin condicion alguna

mayor: ; despliega mensaje de que es mayor
    mov edx, OFFSET msgEsmayoroigual
    call WriteString 

fin: ; salta de linea y termina
    call crlf
    exit

main ENDP
END main
