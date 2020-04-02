STACK SEGMENT PARA STACK
	DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

	BALL_X DW 0Ah ;X position of the ball
	BALL_Y DW 0Ah ;Y position of the ball
	BALL_SIZE DW 04h ;size of the ball

DATA ENDS

CODE SEGMENT PARA 'CODE'

	MAIN PROC FAR
	ASSUME CS:CODE,DS:DATA,SS:STACK ;assume as code date and stack segments the respective registers
	PUSH DS ;push to the stack the DS segment	
	SUB AX,AX
	PUSH AX
	MOV AX,DATA
	MOV DS,AX 
	POP AX
	POP AX

	MOV AH,00h ;set the configuration to video mode
	MOV AL,13h ;choose VGA video mode
	INT 10h    ;execute the configuration

	MOV AH,0Bh ;set the confugiration
	MOV BH,00h ;to the blackground color
	MOV BL,00h ;choose black as backgorund color
	INT 10h	   ;execute the configuration

	CALL DRAW_BALL
	
	RET
	MAIN ENDP

	DRAW_BALL PROC NEAR
	
	MOV CX,BALL_X ;set the column (X)
	MOV DX,BALL_Y ;set the line (Y)	
	
	DRAW_BALL_HORIZONTAL:
	MOV AH,0Ch ;set the configuration to writing a pixel
	MOV AL,0Fh ;choose white as color of the pixel
	MOV BH,00h ;set the page number
	INT 10h	   ;execute the configuration	
	INC CX
	MOV AX,CX
	SUB AX,BALL_X
	CMP AX,BALL_SIZE
	JNG DRAW_BALL_HORIZONTAL
	MOV CX,BALL_X
	INC DX
	MOV AX,DX
	SUB AX,BALL_Y
	CMP AX,BALL_SIZE
	JNG DRAW_BALL_HORIZONTAL

	DRAW_BALL_VERTICAL:
	
	RET
	DRAW_BALL ENDP

CODE ENDS
END