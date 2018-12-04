	AREA	ej2,CODE,READWRITE

SWI_Salir	EQU	&11	; Codigo de impresion de salida del programa(11)
VECTOR		DCD	20,21,22,23,24,25,26,27,28,29,3043,31,32,3323,34,35,36,37,38,39,40	


	ENTRY

	ADR r11, VECTOR	; r11 se convierte en puntero hacia VECTOR
	MOV r12, #20	; r12 almacena numero de elementos del vector
	MOV r0,#0	; Registro de resultado a 0
	MOV r3,#0	; Contador a 0
	MOV r2,#0	; Variable acumulativa a 0


BUCLE

	LDR r1,[r11],#4	; postindexado utilizado,
	ADD r3,r3,#1 	; r3 es contador
	ADD r2,r2,r1	; r2 es variable acumulativa
	CMP r3,r12    	; contador<elementos vector?
	BLE BUCLE
	
	MOV r5,r2	; r5 almacena tambien sumatorio de elementos

BUCLEDIV	
	SUB r2,r2,#20
	ADD r0,r0,#1


CONDDIV	CMP r2,r12
	BLT SALIDA
	CMP r2,#0
	BGE BUCLEDIV

 	
SALIDA	SWI SWI_Salir
	

	END
