STACK SEGMENT PARA STACK
	DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

DATA ENDS

CODE SEGMENT PARA 'CODE'

	MAIN PROC FAR
	
	MOV AH,00h ;set the configuration to video mode
	MOV AL,13h ;choose VGA video mode
	INT 10h    ;execute the configuration

	MOV AH,0Bh ;set the confugiration
	MOV BH,00h ;to the blackground color
	MOV BL,00h ;choose black as backgorund color
	INT 10h	   ;execute the configuration

	MOV AH,0Ch ;set the configuration to writing a pixel
	MOV AL,0Fh ;choose white as color of the pixel
	MOV BH,00h ;set the page number
	MOV CX,0Ah ;set the column (X)
	MOV DX,0Ah ;set the line (Y)
	INT 10h	   ;execute the configuration

	RET
	MAIN ENDP

CODE ENDS
END