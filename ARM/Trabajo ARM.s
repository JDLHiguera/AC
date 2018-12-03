;Trabajo realizado por: José Luis Cumbrera Sánchez.  
;						Pablo Rodríguez Gómez. 
;						Pablo López Márquez. 
	


	AREA	Calc,CODE,READWRITE
GUARDAR	DCD	0
CADENA1	DCB	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
SWI_EscrCar	EQU	&0		; codigo de impresion de caracter (0) asignado a SWI_EscrCar
SWI_Salir	EQU	&11		; codigo de impresion de salida del programa(11)
SWI_write0	EQU 	&2
SWI_ReadC	EQU 	&4

	ENTRY					; Punto de entrada del código


	;ADRL r12,CADENA1
	;MOV r11,#49
	;BL READDATA
	;SWI SWI_Salir


READDATA 
	ADRL r12,CADENA1
	MOV r11,#49
	MOV r4,#0		; Contador a 0.
	MOV r6,#0
	MOV r7,#0
	MOV r5,#10		; Multiplicador x10
	MOV r7,r12

	CMP r11,#49		; r11 es 1?
	BLEQ CADENA		; Nos vamos a subrutina cadena.
	CMP r11,#50		; r11 es 2?
	BLEQ NUMERO		; Nos vamos a la subrutina numero.
	
	SWI SWI_Salir
	

NUMERO	ADRL r0,cad2		
	SWI SWI_write0		; Mostramos la cadena 2.

	MUL r4,r6,r5		; Multiplicamos x10 para aumentar nuestro numero.

	SWI SWI_ReadC		; Interrumpimos el sf para leer por teclado.
	MOV r13, r0		; Comparamos para que solo se pueda introducir del 0 al 9. 
	CMP r13,#58		
	BGE NUMERO
	CMP r13,#47
	BLE NUMERO

	SUB r13,r13,#48		; Restamos para obtener el valor decimal en el registro 13.

	ADD r4,r4,r13		; Sumo lo que tengo en total.
	MOV r6,r4		; LO muevo a r6 para poder relizar la multiplicacion.
	
	ADRL r0,cad5		; Imprime la cadena5.
	SWI SWI_write0

	SWI SWI_ReadC		; Interrumpimos el sf para leer por teclado.

	CMP r0,#10
	BEQ NUMERO

	MOV r13,r4		; Movemos r4 a r13.

	STR r13,[r12]		; Guardamos el numero obtenido en la dir. de memoria.

	MOV pc,r14		; Volvemos a READDATA.


CADENA	ADRL r0,cad1		; Imprime un salto de linea.
	SWI SWI_write0
	
	ADRL r0,cad3		; Mostramos cadena 3.
	SWI SWI_write0
	
	SWI SWI_ReadC		; Interrumpimos el sf para leer por teclado.
	MOV r13,r0

	ADRL r0,cad1
	SWI SWI_write0		; Imprime un salto de linea.

	CMP r13,#10		; Se ha introducido enter?
	BEQ ENTER		; Si es asi salta a enter, para dejar de introducir la cadena.
	
	STRB r13,[r12],#1		; Se guarda lo introducido en r13 en la dir. de memoria.
	ADD r4,r4,#1		; Aumentamos el contador en 1.

	ADRL r0,cad4		; Mostramos cadena 4.
	SWI SWI_write0

	MOV r0,r13		; Movemos r13 a r0
	SWI SWI_EscrCar		; Imprimimos el caracter contenido en r0.

	B CADENA			; Vuelve a cadena.


ENTER	ADD r4,r4,#1		; Sumamos 1 por el 0 final de la cadena.

	ADRL r0,cad6
	SWI SWI_write0
	
	STRB r6,[r12]		; Añado un 0 al final de la cadena

	MOV r12,r7

	MOV r13,r4		; Movemos a r13 el contador de la cantidad de caracteres impresos.
		
	MOV pc,r14		; Volvemos a ReadData

	

cad1	= &0a, &0d, 0
cad2	= "Introduce un digito(0-9): ", &0a, &0d, 0
cad3	= "Se ha reservado espacio para 20 caracteres.", &0a, &0d ,"Introduzca un caracter,introduzca enter para finalizar:", &0a, &0d, 0
cad4	= "Se ha introducido el caracter: ", &a0, &0d, 0
cad5	= "Si desea introducir otro caracter pulse ENTER:", &0a, &0d, 0
cad6	= "Se ha introducido la cadena en memoria.", &a0, &0d, 0

END

        