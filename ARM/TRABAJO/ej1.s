	AREA	ej1,CODE,READWRITE

SWI_Salir	EQU	&11
SWI_write0	EQU 	&2

c		DCB	21 	; Constante c con valor 21
CADENA		DCB	"aaaaaaaaaabbbbbbbbcc", &a, &d,0
CADENA2 % 21			; Reserva espacio para CADENA2

	ALIGN

	ENTRY

	MOV r0,#0		; r0 es contador a 0
	ADR r1,c		; r1 apunta a c
	ADR r2,CADENA		; r2 apunta a CADENA
	ADR r3,CADENA2		; r3 apunta a CADENA2


	
BUCLE	LDRB r4,[r1]		; cargamos en r4 valor guardado en c (21)
	LDRB r5,[r2]		; cargamos en r5 caracter de CADENA
	
	
	EOR r6,r5,r4		; r6 = origen[i] XOR c
	STRB r6,[r3]		; guardamos valor obtenido de r6 en CADENA2

	ADD r2,r2,#1		; avanzamos 1 caracter de CADENA
	ADD r3,r3,#1		; avanzamos 1 caracter de CADENA2

	ADD r0,r0,#1		; contador ++
	CMP r0,#20		; contador < elementos cadena?
	BLT BUCLE		; salto a BUCLE
	

	ADR	r0,CADENA	; r0 apunta a CADENA
	SWI 	SWI_write0	; escribimos por pantalla contenido de CADENA
	
	ADR	r0,CADENA2	; r0 apunta a CADENA2
	SWI 	SWI_write0	; escribimos por pantalla contenido de CADENA2
	
	SWI SWI_Salir		; Salir


	END
