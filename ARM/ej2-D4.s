	AREA	ej2-D4,CODE,READWRITE

SWI_Salir	EQU	&11	; Codigo de impresion de salida del programa(11)
VECTOR		DCD	20,256,22,23,24,25,212356,27,28,59,30,131,32,33,34,35,36,37,38,39,152	


	ENTRY

	ADR r11, VECTOR	; r11 se convierte en puntero hacia VECTOR
	MOV r12, #20	; r12 almacena numero de elementos del vector
	MOV r0,#0	; Registro de resultado a 0
	MOV r3,#0	; Contador a 0


BUCLE  	LDR r1,[r11],#4	; Cargamos en r1 primera pos de VECTOR (postindexado) 
	ADD r3,r3,#1	; Contador= Contador+1	
	CMP r1, r0	; Si valor actual del vector > maximo - > salto a maximo
	BGT MAXIMO

	
ITER	CMP r3,r12	; si contador <= elementos vector hago iteracion
	BLE BUCLE


SALIDA	SWI SWI_Salir

MAXIMO	MOV r0,r1	; maximo = valor actual del vector
	B ITER

 	

	END
