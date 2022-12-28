// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INIT)
    @SCREEN
    D=A
    @screenaddr
    M=D             // screenaddr = 16384
                    // (screen's base address)
    
    @KBD
    D=A
    @kbdaddr
    M=D             // kbdaddr = 24576
                    // (keyboard's base address)

    @kbdaddr
    A=M
    D=M
    @WHITE
    D;JEQ           // if RAM[kbdaddr]==0, go to WHITE

(BLACK)
    @24576
    D=A
    @screenaddr
    D=D-M
    @INIT
    D;JEQ           // if screenaddr-24575==0 go to INIT

    @screenaddr
    A=M
    M=-1            // RAM[screenaddr] = -1

    @screenaddr
    M=M+1           // screenaddr = screenaddr + 1
    @BLACK
    0;JMP           // go to BLACK

(WHITE)
    @24576
    D=A
    @screenaddr
    D=D-M
    @INIT
    D;JEQ           // if screenaddr-24575==0 go to INIT

    @screenaddr
    A=M
    M=0             // RAM[screenaddr] = 0

    @screenaddr
    M=M+1           // screenaddr = screenaddr + 1
    @WHITE
    0;JMP           // go to WHITE
