.ORIG x3000
START LEA R0, DISCLAIMER	;load Disclaimer
	PUTS			;Output to screen
	JSR SCORE
	STI R3, TENS		;Store Value in Tens Digit
	STI R4, ONES

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
	GETC
	OUT
	ADD R4, R0, x0
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-10
	BRP ERROR
	ADD R4, R4, #10
	RET

ERROR	LEA R0, ERMSG
	PUTS

DISPLAY	AND R5, R5, x0
	AND R6, R6, x0
	LDI R5, TENS
	LDI R6, ONES
	PUTS

ERMSG	.STRINGZ "Enter valid number"

PROMPT	.STRINGZ "Enter score: "

DISCLAIMER	.STRINGZ "This code can only take scores up to 99, Please enter 5 scores\n"



TENS	.FILL x3100
ONES	.FILL x3101



.END
