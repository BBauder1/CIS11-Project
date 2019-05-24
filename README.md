.ORIG x3000
START LEA R0, DISCLAIMER	;load Disclaimer
	PUTS			;Output to screen
	JSR SCORE

	JSR DISPLAY		;temperary use

SCORE	LDI R1, TENS
	LDI R2, ONES
	AND R0, R0, x0 
	LEA R0, PROMPT		;load Prompt
	PUTS
	GETC
	OUT
	ADD R3, R0, x0
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16	;Convert ASCII to decimal
	ADD R3, R3, #-10
	BRp ERROR		;Input validation
	ADD R3, R3, #10
	JSR MULT
	GETC
	OUT
	ADD R4, R0, x0
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-10
	BRP ERROR
	ADD R4, R4, #10
	ADD R2, R2, R4
	AND R3, R3, x0
	ADD R3, R1, R2
	RET

ERROR	LEA R0, ERMSG
	PUTS

DISPLAY	ADD R3, R3, #0
	ADD R0, R0, R3
	PUTS

MULT	AND R1, R1, x0
	LDI R1, TENS
	AND R6, R6, x0
	ADD R6, R6, #-10
MULTS	AND R2, R2, x0
	ADD R2, R1, R1
	ADD R6, R6, #1
	BRnp MULTS
	STI R2, TENS
	RET
	


ERMSG	.STRINGZ "Enter valid number"

PROMPT	.STRINGZ "Enter score: "

DISCLAIMER	.STRINGZ "This code can only take scores up to 99, Please enter 5 scores\n"



TENS	.FILL x3100
ONES	.FILL x3101



.END	
