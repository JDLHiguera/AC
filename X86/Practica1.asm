.Const

.Data

;=======================================================
;Ejercicio 1: Declare el vector de 4 elementos tipo Word
;=======================================================
VECTOR: DW 1, 1, 2, 3
.Code

start:

	;=================================================================
	;Ejercicio 2: Calcule el sumatorio de los 4 componentes del vector
	;             El resultado debe quedar en EAX.
	;=================================================================
	Xor Eax, Eax ;< --Eax se pone a 0
	Mov Eax, 0   ;<-- Rellena eax a 0 (equivalente en este uso a la anterior)
    Mov Ax, [VECTOR]
    Add Ax, [VECTOR + 2]
    Add Ax, [VECTOR + 4]
    Add Ax, [VECTOR + 6]


	;=================================================================
	;Ejercicio 3: Divida por 4 el sumatorio sin usar DIV ni IDIV
	;             El resultado debe quedar en EAX.
	;=================================================================

	Xor Eax, Eax
	Invoke ExitProcess, Eax


