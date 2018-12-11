	AREA	ej3,CODE,READWRITE

SWI_Salir	EQU	&11 ; Codigo de impresion de salida del programa(11)
ORIGEN		DCD	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20	
DESTINO		DCD	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20

	ENTRY

	ADR r1, ORIGEN	; r1 apunta a ORIGEN(n)
	ADR r2, ORIGEN	; r2 apunta a ORIGEN(n)
	ADD r2,r2,#4	; r2 apunta a ORIGEN(n+1)
	ADR r3, ORIGEN	; r3 apunta a ORIGEN(n)
	ADD r3,r3,#8	; r3 apunta a ORIGEN(n+2)
	ADR r4, DESTINO	; r4 apunta a DESTINO

	MOV r10,#0	; r10 es contador a 0
	MOV r11,#18	; r11 almacena nº elementos a rellenar en destino (podra hasta 18)

BUCLE
	LDR r5,[r1],#4	; cargamos en r5 valor n de ORIGEN
	LDR r6,[r2],#4	; cargamos en r6 valor n+1 de ORIGEN
	ADD r6,r6,r6	; r6 = 2*(n+1) 
	LDR r7,[r3],#4	; cargamos en r7 valor n+2 de ORIGEN 

	ADD r8,r5,r7	; r8 = n + (n+2)
	SUB r9,r6,r8	; r9 = 2*(n+1) - (n + (n+2))

	STR r9,[r4],#4	; guardamos valor de r9 en pos n de DESTINO
	
	ADD r10,r10,#1 	; contador ++
	CMP r10,r11    	; contador < elementos destino ?
	BLT BUCLE	; salto a BUCLE
	
	SWI SWI_Salir	; Salir

 	END