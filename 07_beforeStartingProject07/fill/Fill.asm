// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
(INIT)
@i
M=0
@8191
D=A
@n
M=D
@SCREEN
D=A
@addrScreen
M=D
@KBD
D=A
@addrKeyboard
M=D
@addrKeyboard
A=M
D=M
@KEYUNPRESSED
D;JEQ // keyboard not pressed

(KEYPRESSED)
@i
D=M
@n
D=D-M //if i>n
@INIT
D;JGT //if i>n stop
@addrScreen
A=M
M=-1
@i
M=M+1 // i=i+1
@1
D=A
@addrScreen
M=D+M
@KEYPRESSED
0;JMP

(KEYUNPRESSED)
@i
D=M
@n
D=D-M //if i>n
@INIT
D;JGT //if i>n stop
@addrScreen
A=M
M=0
@i
M=M+1 // i=i+1
@1
D=A
@addrScreen
M=D+M
@KEYUNPRESSED
0;JMP
