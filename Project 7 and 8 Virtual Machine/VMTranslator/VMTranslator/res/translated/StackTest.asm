// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
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
	M=-1
	@EQ_DONE_0
	0;JMP
(NOT_EQ_0)
	@SP
	A=M-1
	M=0
(EQ_DONE_0)

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 16
@16
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
	M=-1
	@EQ_DONE_1
	0;JMP
(NOT_EQ_1)
	@SP
	A=M-1
	M=0
(EQ_DONE_1)

// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
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
@IS_EQ_2
D;JEQ
@NOT_EQ_2
0;JMP

(IS_EQ_2)
	@SP
	A=M-1
	M=-1
	@EQ_DONE_2
	0;JMP
(NOT_EQ_2)
	@SP
	A=M-1
	M=0
(EQ_DONE_2)

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

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
	M=-1
	@LT_DONE_0
	0;JMP
(NOT_LT_0)
	@SP
	A=M-1
	M=0
(LT_DONE_0)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
M=M-1
A=M
D=M
A=A-1
D=M-D
@IS_LT_1
D;JLT
@NOT_LT_1
0;JMP

(IS_LT_1)
	@SP
	A=M-1
	M=-1
	@LT_DONE_1
	0;JMP
(NOT_LT_1)
	@SP
	A=M-1
	M=0
(LT_DONE_1)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
M=M-1
A=M
D=M
A=A-1
D=M-D
@IS_LT_2
D;JLT
@NOT_LT_2
0;JMP

(IS_LT_2)
	@SP
	A=M-1
	M=-1
	@LT_DONE_2
	0;JMP
(NOT_LT_2)
	@SP
	A=M-1
	M=0
(LT_DONE_2)

// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
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
	M=-1
	@GT_DONE_0
	0;JMP
(NOT_GT_0)
	@SP
	A=M-1
	M=0
(GT_DONE_0)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32767
@32767
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
@IS_GT_1
D;JGT
@NOT_GT_1
0;JMP

(IS_GT_1)
	@SP
	A=M-1
	M=-1
	@GT_DONE_1
	0;JMP
(NOT_GT_1)
	@SP
	A=M-1
	M=0
(GT_DONE_1)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
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
@IS_GT_2
D;JGT
@NOT_GT_2
0;JMP

(IS_GT_2)
	@SP
	A=M-1
	M=-1
	@GT_DONE_2
	0;JMP
(NOT_GT_2)
	@SP
	A=M-1
	M=0
(GT_DONE_2)

// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 53
@53
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
M=D+M
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
M=M-1
A=M
D=M
A=A-1
M=M-D
// neg
@SP
A=M-1
M=-M

// and
@SP
M=M-1
A=M
D=M
A=A-1
M=D&M

// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1

// or
@SP
M=M-1
A=M
D=M
A=A-1
M=D|M

// not
@SP
A=M-1
M=!M

