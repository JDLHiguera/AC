	AREA	Calc,CODE,READWRITE

RESULTADO  	DCB 	0,0,0,0,0,0,0   	; Vector de 7 elementos, inicializado a 0.
		ALIGN

SWI_EscrCar	EQU	&0		; codigo de impresion de caracter (0) asignado a SWI_EscrCar
SWI_Salir	EQU	&11		; codigo de impresion de salida del programa(11)
SWI_write0	EQU 	&2
SWI_ReadC	EQU 	&4

	ENTRY					; Punto de entrada del código

INICIO   ADR	r10, RESULTADO			; r10 es un puntero que apunta a RESULTADO
         ADR 	r0, cad1				; Obtenemos la direccion de la cadena1
	SWI 	SWI_write0			; Interrupcion de Soft. para mostrar la cadena
		; PARA INTRODUCIR EL DATO PONER PUNTO DE RUPTURA EN LA SIGUIENTE LINEA Y INTRODUCIR EL DATO EN R0
	MOV	r1, r0				; Movemos el valor introducido en r0 a r1



	ADR 	r0, cad2				; Obtenemos la direccion de la cadena2
	SWI 	SWI_write0			; Interrupcion de Soft. para mostrar la cadena
		; PARA INTRODUCIR EL DATO PONER PUNTO DE RUPTURA EN LA SIGUIENTE LINEA Y INTRODUCIR EL DATO EN R0
	MOV	r2, r0				; Movemos el valor introducido en r0 a r1


	ADR 	r0, cad3				; Obtenemos la direccion de la cadena3
	SWI 	SWI_write0			; Interrupcion de Soft. para mostrar la cadena
         

	
	SWI 	SWI_ReadC			; Interrupcion de Soft. para leer un caracter de teclado
         CMP 	r0, #49				; Se ha pulsado la tecla 1 ??
	BLEQ 	SUMA				; 	ejecuta la rutina SUMA
	CMP 	r0, #50				; Se ha pulsado la tecla 2 ??
	BLEQ 	PROD				; 	ejecuta la rutina PROD
	CMP 	r0, #51				; Se ha pulsado la tecla 3 ??
	BLEQ 	RESTA				; 	ejecuta la rutina RESTA
	CMP 	r0, #52				; Se ha pulsado la tecla 4 ??
	BLEQ 	DIV			         ;        ejecuta la rutina DIV
	CMP 	r0, #53				; Se ha pulsado la tecla 5 ??
	BLEQ 	POTENCIA			         ;        ejecuta la rutina POTENCIA
	CMP 	r0, #54				; Se ha pulsado la tecla 6 ??
	BLEQ 	FACTORIAL			         ;ejecuta la rutina FACTORIAL
	CMP 	r0, #55				; Se ha pulsado la tecla 7 ??
	BLEQ 	SALIR			         ;        ejecuta la rutina SALIR

	

	ADRL 	r0, cad4				; Obtenemos la direccion de la cadena3 Y USAMOS ADRL PARA LA BUSQUEDA MAYOR
	SWI 	SWI_write0			; Interrupcion de Soft. para mostrar la cadena


	; PARA INTRODUCIR EL DATO PONER PUNTO DE RUPTURA EN LA SIGUIENTE LINEA Y CONSULTAR EL RESULTADO EN R3
         B INICIO
SALIR	SWI SWI_Salir ; Sale del programa


SUMA	ADD	r3, r1, r2        ; en este momento r10 apunta a 0x008000, que es la primera posicion del vector RESULTADO

	STR 	r3, [r10]	; Guardamos el resultado en el puntero que apunta al vector RESULTADO

	MOV pc, r14

PROD
	MUL	r3, r1, r2

	ADD	r10,r10,#4	; Sumamos 4 a la dirección. Pasará a segunda posición del vector (0x008004)
	STR 	r3, [r10]	; Guardamos el resultado en el puntero que apunta al vector RESULTADO

         MOV pc, r14

RESTA
	SUB	r3, r1, r2
	ADD	r10,r10,#8	; Sumamos  a la posición del vector. Pasará a tercera posición.(0x008008)
	STR 	r3, [r10]	; Guardamos el resultado en el puntero que apunta al vector RESULTADO

         MOV pc, r14



DIV
  
         CMP      r2,#0
         BEQ SALIDADIV      

         MOV r3, #0  ; COCIENTE =0
         
         B CONDDIV
BUCLEDIV
         SUB r1, r1, r2 ; DIVIDENDO= DIVIDENDO - DIVISOR
         ADD r3, r3, #1 ; COCIENTE = COCIENTE +1 


CONDDIV  CMP r1,r2
         BGE BUCLEDIV
	
         MOV r5, r1      ; RESIDUO = DIVIDENDO

         ADRL 	r0, cad6				
	SWI 	SWI_write0
         ADRL 	r0, cad7			
	SWI 	SWI_write0
         ADD	r10,r10,#12	; Sumamos  a la posición del vector. Pasará a tercera posición.(0x008008)
	STR 	r3, [r10]	; Guardamos el resultado en el puntero que apunta al vector RESULTADO

         MOV pc, r14   ; sale 
         


SALIDADIV
         ADRL r0, cad5
         SWI 	SWI_write0
         B INICIO 
     


POTENCIA
	CMP r2, #0
         BEQ POTCERO

         MOV r3, #0
         MOV r3, r1
         B CONDPOT

BUCLEPOT MUL r4, r1, r3  ; MULTIPLICAMOS BASE POR ACUMULADO
         MOV r3, r4   ;  ; MOVEMOS ACUMULADO A R3 PARA USARLO EN LA PROXIMA MULTIPLICACION
         SUB r2, r2, #1  ; BAJAMOS EN 1 EL EXPONENTE

CONDPOT  CMP r2, #1      ; SI EXPONENTE ES MAYOR QUE 1 SALTAR AL BUCLE
         BGT BUCLEPOT

         
         MOV pc, r14   ; sale 


POTCERO MOV r3, #1   ; CUALQUIER NUMERO ELEVADO A 0 DARÁ 1 
        MOV pc, r14



FACTORIAL MOV r2, r1
          SUB r2,r2, #1   ; usaremos r2 para si el factorial es de 5, r2 sea el 4 e ir bajando
          MOV r4,r1       ; r4 será el registro auxiliar ya que no podemos usarlo como fuente y destino en MUL
          B CONDFACT     

BUCLEFAT  MUL r4, r1, r2  ; Multiplicamos numero n por n-1
          MOV r1, r4      ; Guardamos resultado en r1, que usaremos como variable acumulativa
          SUB r2, r2, #1  ; n-1 a proximo numero para factorial
CONDFACT  CMP r2, #0
          BGT BUCLEFAT
          MOV pc, r14

cad1	=	"Intoduce operando 1 en registro r0 y pulsa F5", &0a, &0d, 0
cad2	=	"Intoduce operando 2 en registro r0 y pulsa F5", &0a, &0d, 0
cad3	=	"Elige operacion PULSANDO EN TECLADO el numero correspondiente:", &0a, &0d,"1. Sumar", &0a, &0d,"2. Multiplicar", &0a, &0d,"3. Restar",  &0a, &0d, "4. Dividir", &0a, &0d, "5. Potencia", &0a, &0d, "6. Salir del programa", &0a, &0d, 0
cad4	=	&0a, &0d, "Programa terminado. Resultado en r3", &0a, &0d, 0
cad5     =        "El divisor no puede ser 0",&0a, &0d, 0
cad6     =        "El cociente esta en r3" , &0a, &0d, 0
cad7     =        "El resto esta en r5" , &0a, &0d, 0


	END

        
