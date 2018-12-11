	AREA ej2,CODE,READWRITE

SWI_Salir	EQU	&11 ; codigo de impresion de salida del programa(11)
CADENA		DCB	"aaaaaKaaaabbbpbbbbbc", &a, &d,0
	ALIGN

	ENTRY

	ADR r11,CADENA	; r11 apunta a CADENA
	MOV r12, #20	; r12 almacena nº de caracteres de CADENA sin terminador
	MOV r0,#0	; r0 (almacena caracter maximo) a 0
	MOV r2,#0	; r2 es contador a 0

BUCLE	LDRB r1,[r11],#1	; cargamos en r1 caracter de CADENA
	CMP r1,r0	; r1 > r0 ? (caracter actual > maximo)
	BGT MAXIMO	; salto a MAXIMO

ITERA	ADD r2,r2,#1	; contador ++
	CMP r2,r12	; r2 < r12 ? (contador < caracteres CADENA sin terminador)
	BLT BUCLE	; salto a BUCLE


	SWI SWI_Salir	; Salir
	
MAXIMO	MOV r0,r1	; Almacenamos en r0 (maximo) caracter actual de CADENA (r1)
	BL ITERA


	END