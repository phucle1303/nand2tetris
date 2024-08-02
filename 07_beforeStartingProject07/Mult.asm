// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
@R0
D=M
@firstNum
M=D //firstNum = R0

@R1
D=M
@secondNum
M=D //secondNum = R1

@R2
M=0
D=M
@result
M=D //result = R2

@i
M=1 // i = 1

(LOOP)
@i
D=M
@secondNum
D=D-M // i=i-R1
@STOP
D;JGT // if (i-R1>0) then STOP

@result
D=M
@firstNum
D=D+M //result = result + R0
@result
M=D 
@i
M=M+1 // i=i+1
@LOOP
0;JMP

(STOP)
@result
D=M
@R2
M=D //R2 = result

(END)
@END
0;JMP
