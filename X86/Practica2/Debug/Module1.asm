.Const

.Data

frecuencias DW 0, 260, 300, 330, 350, 390, 440, 500, 520, 590, 660, 700
notas DW 7, 8, 9, 9, 8, 7, 6, 5, 5, 6, 7, 7, 6, 6, 7, 8, 9, 9, 8, 7, 6, 5, 5, 6, 7, 6, 5, 5, 6, 6, 7, 5, 6, 7, 8, 7, 5, 6, 7, 8, 7, 6, 5, 6, 2, -1
tempos DW 2000, 1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,2000,500,500,2000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1500,500,2000,2000,1000,1000,1000,500,500,1000,1000,1000,500,500,1000,1000,1000,1000,2000,2000

.Code

start:

	;==========================================================================================================================
	;EJERCICIO 1:
	;
	;Complete el programa. Recuerde, para invocar la funcion:
	;
	; pusha
	; Invoke Beep, frecuencia_nota, duracion_nota_ms
	; popa
	;==========================================================================================================================

	 		Xor Eax, Eax

inicio_bucle:


			 Cmp w[notas + eax],-1
			 Je > fin_bucle ; si valor notas[i] es -1 salta a fin
			 
			 mov ebx, [notas + eax]
			 
			 pusha
			 Invoke Beep,[frecuencias + ebx],[tempos + eax]
			 popa


			 Add eax, 2
			 Jmp inicio_bucle



fin_bucle:

	Invoke system, "pause"
	Xor Eax, Eax
	Invoke ExitProcess, Eax


