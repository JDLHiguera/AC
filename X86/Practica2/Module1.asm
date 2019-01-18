.CONST

.DATA

frecuencias DW 0, 260, 300, 330, 350, 390, 440, 500, 520, 590, 660, 700
notas DW 7, 8, 9, 9, 8, 7, 6, 5, 5, 6, 7, 7, 6, 6, 7, 8, 9, 9, 8, 7, 6, 5, 5, 6, 7, 6, 5, 5, 6, 6, 7, 5, 6, 7, 8, 7, 5, 6, 7, 8, 7, 6, 5, 6, 2, -1
tempos DW 2000, 1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,2000,500,500,2000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1500,500,2000,2000,1000,1000,1000,500,500,1000,1000,1000,500,500,1000,1000,1000,1000,2000,2000

.CODE

start:
    mov eax , 0
while:
	mov ebx,0
	mov bx,[notas+2*eax]
	cmp bx,0
	jl > end
	mov edx,0
	mov dx,[frecuencias+2*ebx]
	mov ecx,0
	mov cx,[tempos*2*eax]
	inc eax
	pusha
	Invoke Beep, edx,ecx
	popa
	jmp	while	          
end:
    Invoke system, "pause"
    Xor Eax, Eax
    Invoke ExitProcess, Eax
