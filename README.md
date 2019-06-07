# CIS11-Project
	.ORIG x3000

	AND R0, R0, x0 
	LEA R0, PROMPT		;load Prompt
	PUTS
	ADD R1, R1, #1
	STI R1, CHECK
	JSR SCORE

TOP	STI R5, TEST1
	AND R1, R1, x0
	ADD R1, R1, #2
	STI R1, CHECK
	JSR SCORE

TOP2	STI R5, TEST2
	AND R1, R1, x0
	ADD R1, R1, #3
	STI R1, CHECK
	JSR SCORE

TOP3	STI R5, TEST3
	AND R1, R1, x0
	ADD R1, R1, #4
	STI R1, CHECK
	JSR SCORE

TOP4	STI R5, TEST4
	AND R1, R1, x0
	ADD R1, R1, #5
	STI R1, CHECK
	JSR SCORE

TOP5	STI R5, TEST5

	JSR DIV

T3	JSR DECODE

DONE	JSR EXIT

CHK	AND R1, R1, x0
	LDI R1, CHECK
	ADD R1, R1, #-1
	BRz TOP
	ADD R1, R1, #-1
	BRz TOP2
	ADD R1, R1, #-1
	BRz TOP3
	ADD R1, R1, #-1
	BRz TOP4
	ADD R1, R1, #-1
	BRz TOP5

SCORE	AND R0, R0, x0 
	LEA R0, SKIP		
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
	AND R5, R5, x0
	ADD R5, R3, R4
	AND R0, R0, x0 
	ADD R0, R5, x0
	BR CHK

DECODE	AND R0, R0, x0
	LEA R0, SKIP
	PUTS
	AND R1, R1, x0
	AND R2, R2, x0
	LDI R1, AVG
	ADD R2, R2, #-10
	AND R3, R3, x0

DLOOP	ADD R3, R3, #1
	ADD R1, R1, R2
	BRzp DLOOP
	ADD R3, R3, #-1
	BR GRADE

DC	ADD R1, R1, #10
	AND R0, R0, x0
	ADD R0, R3, x0
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #3
	OUT
	AND R0, R0, x0
	ADD R0, R1, x0
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #3
	OUT
	BR DONE

GRADE	AND R5, R5, x0
	ADD R5, R5, R3
	ADD R5, R5, #-5
	BRz DISF
	ADD R5, R5, #-1
	BRz DISD
	ADD R5, R5, #-1
	BRz DISC
	ADD R5, R5, #-1
	BRz DISB
	ADD R5, R5, #-1
	BRz DISA

DISF	LEA R0, F
	PUTS
	JSR DC

DISD	LEA R0, D
	PUTS
	JSR DC

DISC	LEA R0, C
	PUTS
	JSR DC

DISB	LEA R0, B
	PUTS
	JSR DC

DISA	LEA R0, A
	PUTS
	JSR DC

MULT	AND R1, R1, x0
	AND R2, R2, x0
	ADD R2, R2, #-10
MULTS	ADD R4, R4, R3
	ADD R2, R2, #1
	BRn MULTS
	AND R3, R3, x0
	ADD R3, R3, R4
	RET

DIV	AND R1, R1, x0
	AND R2, R2, x0
	AND R3, R3, x0
	AND R4, R4, x0
	LDI R1, TEST1
	LDI R2, TEST2
	ADD R1, R1, R2
	LDI R2, TEST3
	ADD R1, R1, R2
	LDI R2, TEST3
	ADD R1, R1, R2
	LDI R2, TEST5
	ADD R1, R1, R2
DIVLP 	ADD R3, R3, #1
	ADD R1, R1, #-5
	BRp DIVLP
	ADD R4, R4, R3
	BRn DIVLP
	STI R4, AVG
	BR T3
	


ERROR	LEA R0, ERMSG
	PUTS

EXIT	HALT

ERMSG	.STRINGZ "Enter valid number"

PROMPT	.STRINGZ "\nEnter 5 scores: "
SKIP	.STRINGZ "\n"
F	.STRINGZ "Grade:F	"
D	.STRINGZ "Grade:D	"
C	.STRINGZ "Grade:C	"
B	.STRINGZ "Grade:B	"
A	.STRINGZ "Grade:A	"

AVG	.FILL x3100
TEST1	.FILL x3101
TEST2	.FILL x3102
TEST3	.FILL x3103
TEST4	.FILL x3104
TEST5	.FILL x3105

CHECK	.FILL x3108


	.END
