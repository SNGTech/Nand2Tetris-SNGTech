// push constant 5
@5
D=A
@SP
A=M
M=D

@SP
M=M+1

// push constant 5
@5
D=A
@SP
A=M
M=D

@SP
M=M+1

// eq
@SP
M=M-1
A=M
D=M
A=A-1
D=M-D
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

// push constant 0
@0
D=A
@SP
A=M
M=D

@SP
M=M+1

// eq
@SP
M=M-1
A=M
D=M
A=A-1
D=M-D
@IS_EQ_1
D;JEQ
@NOT_EQ_1
0;JMP

(IS_EQ_1)
	@SP
	A=M-1
	M=1
	@EQ_DONE_1
	0;JMP
(NOT_EQ_1)
	@SP
	A=M-1
	M=0
(EQ_DONE_1)

