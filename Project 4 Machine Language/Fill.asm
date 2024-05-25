// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// addr = SCREEN

// i = 0
// (FILL)
//  if i > 8K GOTO KEY_DETECT
//  SCREEN = -1
//  addr++
//  i++
//  GOTO FILL

// (KEY_DETECT)
//  if KBD != 0 GOTO FILL
//  GOTO KEY_DETECT

@pixel
M=0

(INIT)
    @SCREEN
    D=A
    @addr
    M=D

    @i
    M=0

    @FILL
    0;JMP

(FILL_BLACK)
    @pixel
    M=-1

    @INIT
    0;JMP

(FILL)
    @i
    D=M
    @8192
    D=D-A
    @KEY_DETECT
    D;JEQ

    @pixel
    D=M
    @addr
    A=M
    M=D

    @addr
    M=M+1

    @i
    M=M+1
    @FILL
    0;JMP

(FILL_WHITE)
    @pixel
    M=0

    @INIT
    0;JMP

(KEY_DETECT)
    @KBD
    D=M
    @FILL_BLACK
    D;JNE
    
    @FILL_WHITE
    D;JMP