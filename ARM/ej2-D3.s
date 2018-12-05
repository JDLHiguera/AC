	AREA	ej3-D2,CODE,READWRITE

SWI_Salir	EQU	&11	; Codigo de impresion de salida del programa(11)
VECTOR		DCD	1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	


	ENTRY

	ADR r1, VECTOR	; r1 apunta a posicion n del vector
	ADR r2, VECTOR	; r2 apunta a posicion n+1 del vector
	ADD r2,r2,#4	; posicion n+1 para r2
	MOV r3, #0	; r3 es contador inicializado a 0
	MOV r4, #18	; r4 son elementos restantes	


BUCLE
	MOV r0,#0	; reseteamos r0 para trabajar con el a continuacion
	LDR r6,[r1],#4	; posicion n en r6
	LDR r7,[r2],#4	; posicion n+1 en r7
	ADD r0,r6,r7	; r0 almacena n + (n+1)
	STR r0,[r2]	; guardamos n + (n+1) en posicion n+2 (n+2 por el postindexado)
	
	ADD r3,r3,#1 	; contador + 1
	CMP r3,r4  	; contador<elementos restantes? - > iteracion
	BLT BUCLE
	

 	SWI SWI_Salir
	

	END
