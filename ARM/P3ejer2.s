	AREA	P3ejer2,CODE,READWRITE

SWI_Salir	EQU	&11	; Codigo de impresion de salida del programa(11)
RESULTADO	DCD	3,4,1,2	



	ENTRY


	MOV r0, #0	; Contador en r0, inicializado en  0
	MOV r2, #0	; Variable acumuladora en r2, inicializada en 0

	ADR r1, RESULTADO	; r1 se convierte en puntero hacia RESULTADO
	BL BUCLE		; Saltamos a BUCLE incondicionalmente
	SWI SWI_Salir	; Salida del programa


BUCLE

	LDRB r3,[r1],#4	; Técnica de postindexado utilizada, en la que la dirección almacenada en el registro r1 se actualiza tras el acceso a memoria
	ADD r0,r0,#1 
	ADD r2,r2,r3
	CMP r0,#3
	BLT BUCLE
	STRB r2,[r1]
	MOV pc,r14





	END
