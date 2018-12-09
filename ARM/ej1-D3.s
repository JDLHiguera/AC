	AREA	ej1,CODE,READWRITE

SWI_Salir	EQU	&11
SWI_write0	EQU 	&2

CADENA		DCB	"abcdefghijklmGbbbbbc", &a, &d,0
c		EQU 	21 	
CADENA2 % 21		; Reserva espacio para CADENA2

	ALIGN

	ENTRY

	MOV r0,#0		; r0 es contador a 0
	ADR r1,CADENA		; r1 apunta a CADENA1
	ADR r2,CADENA2		; r2 apunta a CADENA2
	ADR r3,c			; r3 apunta a c
	;MOV r3, #21		; para testear diferencias
	
BUCLE	LDRB r4,[r1],#1		; cargamos en r4 caracter de CADENA

	
	EOR r5,r4,r3		; r5 = origen[i] XOR c
	STRB r5,[r2],#1		; guardamos rloquesea en CADENA2
	
	ADD r0,r0,#1	
	CMP r0,#20
	BLT BUCLE
	

	ADR	r0,CADENA
	SWI 	SWI_write0
	
	ADR	r0,CADENA2
	SWI 	SWI_write0

	SWI SWI_Salir


	END



