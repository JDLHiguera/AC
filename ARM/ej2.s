	AREA	ej2,CODE,READWRITE

SWI_Salir	EQU	&11	; Codigo de impresion de salida del programa(11)
VECTOR		DCD	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,30,20	


	ENTRY

	ADR r11, VECTOR	; r11 se convierte en puntero hacia VECTOR
	MOV r12, #20	; r12 almacena numero de elementos del vector
	MOV r0,#0	; Registro de resultado a 0
	MOV r3,#0	; Contador a 0
	MOV r2,#0	; Variable acumulativa a 0
	BL BUCLE		; Saltamos a BUCLE incondicionalmente
	SWI SWI_Salir	; Salida del programa


BUCLE

	LDRB r1,[r11],#4	; postindexado utilizado,
	ADD r3,r3,#1 	; r3 es contador
	ADD r2,r2,r1	; r2 es variable acumulativa
	CMP r3,r12    	; contador<elementos vector?
	MOV r5,r2	; r5 almacena tambien sumatorio de elementos
	BLT BUCLE
	
	BL CONDDIV

BUCLEDIV	
	SUB r2,r2,#20
	ADD r0,r0,#1


CONDDIV	CMP r2,r12
	BLE SALIDA
	CMP r2,#0
	BGE BUCLEDIV

 	
SALIDA	SWI SWI_Salir
	

	END
