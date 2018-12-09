	AREA	ej3D3,CODE,READWRITE

SWI_Salir	EQU	&11	; Codigo de impresion de salida del programa(11)
ORIGEN		DCD	3,3,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20	
DESTINO		DCD	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20


	ENTRY

	ADR r1, ORIGEN	; r1 se convierte en puntero hacia ORIGEN(n)
	ADR r2, ORIGEN	; r2 se convierte en puntero hacia ORIGEN(n+1)
	ADR r3, ORIGEN	; r3 se convierte en puntero hacia ORIGEN(n+2)
	ADD r2,r2,#4	; puntero r2 apunta a posicion n+1
	ADD r3,r3,#8	; puntero r3 apunta a posicion n+2
	ADR r4, DESTINO	; r4 se convierte en puntero hacia DESTINO

	MOV r10,#0	; r10 es contador a 0
	MOV r11,#18	; r11 son elementos a rellenar en destino (podra hasta n-2)

BUCLE
	MOV r8,#0	; r8 a 0 para trabajar con ella
	LDR r5,[r1],#4	; pos n de origen en r5
	LDR r6,[r2],#4	; pos n+1 de origen en r6
	ADD r6,r6,r6	; (n+1)*2 en r6
	LDR r7,[r3],#4	; pos n+2 de origen en r7

	ADD r8,r5,r7	; r8= n + (n+2)
	SUB r9,r6,r8	; r9 = 2*(n+1) - (n + (n+2))

	STR r9,[r4]	; almacenamos r9 en pos n de destino
	ADD r4,r4,#4	; pos n de destino ++
	
	ADD r10,r10,#1 	; contador ++
	CMP r10,r11    	; contador< elementos destino?
	BLT BUCLE
	


 	
	SWI SWI_Salir
	

	END