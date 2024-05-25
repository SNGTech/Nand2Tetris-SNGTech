// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// i = 0
// (LOOP)
//  if i > R1 GOTO END
//  i++
//  R2 = R0
//  R2 = R2 + R1
// (END)

@i
M=0

@R1
D=M
@R2
M=D

(LOOP)
    @i
    D=M
    @R1
    D=D-M
    D;JEQ
    
    @R2
    D=M
    M=D+M

    @i
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP