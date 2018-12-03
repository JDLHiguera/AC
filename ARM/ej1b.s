	AREA	ej1,CODE,READWRITE

SWI_Salir	EQU	&11
RESULTADO	DCD	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20	; Vector de 4 bytes cada uno

	ENTRY
	
	MOV 	r0, #0		; Registro r0 (donde se almacena el resultado) inicializado a 0
	MOV 	r2, #0		; Contador inicializado a 0
	ADRL	r1, RESULTADO	; r1 se convierte en puntero al vector RESULTADO
	B COND			; Salto incondicional a COND (simulando bucle while)

BUCLE	LDR	r3,[r1],#4	; Cargamos primera palabra de r1 en r3. Usamos post-indexado, por lo que al terminar la instrucción r1 avanzará una palabra (siguiente elemento)
	ADD	r0,r0,r3		; Sumamos a r0 el contenido de la posición del vector en la que estamos
	ADD	r2,r2,#1		; Sumamos 1 a contador

COND	CMP	r2, #20		; Si contador es menor que 20, saltar a etiqueta BUCLE	
	BLT	BUCLE
	
	SWI SWI_Salir


	END