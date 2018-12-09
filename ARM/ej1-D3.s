	AREA	ej1,CODE,READWRITE

SWI_Salir	EQU	&11
SWI_write0	EQU 	&2

CADENA1	=	"Cadenadeveintecaract", &0a, &0d, 0
	ALIGN
CADENA2	% 22	; Reserva espacio para cadena 2
	ALIGN

	ENTRY
	
	ADR r1,CADENA1		; r0 es puntero a CADENA1
	ADR r2,CADENA2		; r1 es puntero a CADENA2
	MOV r6,#0		; r6 es contador inicializado a 0
	
BUCLE	LDRB	r3,[r1]		; Cargamos primera palabra de r1 en r3
	
	EOR r4,r3,#'c'
	
	STRB	r3,[r2]


	ADD	r1,r1,#1		; Sumamos a r0 el contenido de la posición del vector en la que estamos
	ADD	r2,r2,#1
	
	CMP r6, #16
	BGT BUCLE
	

	ADR	r0,CADENA1
	SWI 	SWI_write0
	
	ADR	r0,CADENA2
	SWI 	SWI_write0

	SWI SWI_Salir


	END



