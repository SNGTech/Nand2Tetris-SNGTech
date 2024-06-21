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

// push constant 100
@100
D=A
@SP
A=M
M=D

@SP
M=M+1

// neg
@SP
A=M-1
M=-M

// lt
@SP
M=M-1
A=M
D=M
A=A-1
D=M-D
@IS_LT_0
D;JLT
@NOT_LT_0
0;JMP

(IS_LT_0)
	@SP
	A=M-1
	M=1
	@LT_DONE_0
	0;JMP
(NOT_LT_0)
	@SP
	A=M-1
	M=0
(LT_DONE_0)

// push constant 4
@4
D=A
@SP
A=M
M=D

@SP
M=M+1

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

// push local 2
@2
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop local 2
@2
D=A
@LCL
A=D+M
D=A
@segment
M=D
@SP
M=M-1
A=M
D=M
@segment
A=M
M=D