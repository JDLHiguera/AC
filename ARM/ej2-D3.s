	AREA ej2D3,CODE,READWRITE

SWI_Salir	EQU	&11 ; Codigo de impresion de salida del programa(11)
CADENA		DCB	"aaaaaKaaaabbbpbbbbbc", &a, &d,0
	ALIGN

	ENTRY

	ADR r11,CADENA	; r11 es puntero a inicio de CADENA
	MOV r12, #20	; nº de caracteres de CADENA (sin terminador)
	MOV r0,#0	; r0 inicializado a 00
	MOV r2,#0	; r2 es contador inicializado a 0

BUCLE	LDRB r1,[r11],#1	; Cargamos caracter de CADENA en r1
	CMP r1,r0	; r1 > r0 ?
	BGT MAXIMO	; salto a MAXIMO

ITERA	ADD r2,r2,#1	; contador ++
	CMP r2,r12	; r2 < r12 ?
	BLT BUCLE	; salto a BUCLE


	SWI SWI_Salir	; Salida del programa
	
MAXIMO	MOV r0,r1	; Guardamos en r0 valor actual de CADENA (r1)
	BL ITERA


	END