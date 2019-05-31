.ORIG x3000
	LEA R0, DISCLAIMER	;load Disclaimer
	PUTS			;Output to screen
	
	JSR SCORE
TOP	STI R5, TEST1
	

	
	

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
	STI R3, TENS
	STI R4, ONES
	AND R5, R5, x0
	ADD R5, R3, R4
	BR  TOP
	
	


ERROR	LEA R0, ERMSG
	PUTS


MULT	AND R4, R4, x0
	AND R6, R6, x0
	ADD R6, R6, #-10
MULTS	ADD R4, R4, R3
	ADD R6, R6, #1
	BRn MULTS
	AND R3, R3, x0
	ADD R3, R3, R4
	RET

EXIT	HALT
	


ERMSG	.STRINGZ "Enter valid number"

PROMPT	.STRINGZ "Enter score: "
	

DISCLAIMER	.STRINGZ "This code can only take scores up to 99, Please enter 5 scores\n"



TENS	.FILL x3100
ONES	.FILL x3101
VALUE	.FILL x3102
TEST1	.FILL x3103
TEST2	.FILL x3104
TEST3	.FILL x3105
TEST4	.FILL x3106
TEST5	.FILL x3107



.END	
