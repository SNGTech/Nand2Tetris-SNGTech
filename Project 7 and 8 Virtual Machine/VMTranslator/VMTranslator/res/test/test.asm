// Test.asm

// push constant 5
@5
D=A

@SP
A=M
M=D
@SP
M=M+1

// push constant 2
@2
D=A

@SP
A=M
M=D
@SP
M=M+1

// add
@SP
M=M-1
A=M
D=M
A=A-1
M=M+D

// neg
@SP
A=M
M=-M

// eq
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M

@IS_EQ_0
D;JEQ

@NOT_EQ_0
0;JMP

(IS_EQ_0)
	@SP
	A=M-1
	M=1
	@EQ_DONE_0
	0;JMP

(NOT_EQ_0)
	@SP
	A=M-1
	M=0

(EQ_DONE_0)


// gt
@SP
M=M-1
A=M
D=M
A=A-1
D=M-D

@IS_GT_0
D;JGT

@NOT_GT_0
0;JMP

(IS_GT_0)
	@SP
	A=M-1
	M=1
	@GT_DONE_0
	0;JMP

(NOT_GT_0)
	@SP
	A=M-1
	M=0

(GT_DONE_0)