// bootstrap code
@256
D=A
@SP
M=D

// call Sys.init 0

// push returnAddress
@$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

// ARG = SP - 5 - nArgs
@SP
D=M
@ARG
M=D
@5
D=A
@ARG
M=M-D

// LCL = SP
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP

($ret.0)


// file Main

(Main.fibonacci)

	// initialise local variables in function
	// handle function execution

	// push argument 0
	@0
	D=A
	@ARG
	A=D+M
	D=M
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

	// if-goto N_LT_2
	@SP
	M=M-1
	A=M
	D=M
	@Main.fibonacci$N_LT_2
	D+1;JEQ
	D;JGT

	// goto N_GE_2
	@Main.fibonacci$N_GE_2
	0;JMP

// label N_LT_2
(Main.fibonacci$N_LT_2)
	// push argument 0
	@0
	D=A
	@ARG
	A=D+M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// return
	
	// endFrame = LCL
	@LCL
	D=M
	@endFrame
	M=D
	
	// retAddr = *(endFrame - 5)
	@endFrame
	D=M
	@retAddr
	M=D
	@5
	D=A
	@retAddr
	M=M-D
	A=M
	D=M
	@retAddr
	M=D
	
	// *ARG = pop()
	@SP
	M=M-1
	A=M
	D=M
	@ARG
	A=M
	M=D
	
	// SP = ARG + 1
	@ARG
	D=M
	@SP
	M=D+1
	
	// THAT = *(endFrame - 1)
	@endFrame
	D=M
	@THAT
	M=D
	@1
	D=A
	@THAT
	M=M-D
	A=M
	D=M
	@THAT
	M=D
	
	// THIS = *(endFrame - 2)
	@endFrame
	D=M
	@THIS
	M=D
	@2
	D=A
	@THIS
	M=M-D
	A=M
	D=M
	@THIS
	M=D
	
	// ARG = *(endFrame - 3)
	@endFrame
	D=M
	@ARG
	M=D
	@3
	D=A
	@ARG
	M=M-D
	A=M
	D=M
	@ARG
	M=D
	
	// LCL = *(endFrame - 4)
	@endFrame
	D=M
	@LCL
	M=D
	@4
	D=A
	@LCL
	M=M-D
	A=M
	D=M
	@LCL
	M=D
	
	// goto retAddr
	@retAddr
	A=M
	0;JMP

// label N_GE_2
(Main.fibonacci$N_GE_2)
	// push argument 0
	@0
	D=A
	@ARG
	A=D+M
	D=M
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

	// sub
	@SP
	M=M-1
	A=M
	D=M
	A=A-1
	M=M-D

	// call Main.fibonacci 1
	
	// push returnAddress
	@Main$ret.0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push LCL
	@LCL
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push ARG
	@ARG
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push THIS
	@THIS
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push THAT
	@THAT
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// ARG = SP - 5 - nArgs
	@SP
	D=M
	@ARG
	M=D
	@6
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Main.fibonacci
	0;JMP

(Main$ret.0)

	// push argument 0
	@0
	D=A
	@ARG
	A=D+M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push constant 1
	@1
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

	// call Main.fibonacci 1
	
	// push returnAddress
	@Main$ret.1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push LCL
	@LCL
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push ARG
	@ARG
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push THIS
	@THIS
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push THAT
	@THAT
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// ARG = SP - 5 - nArgs
	@SP
	D=M
	@ARG
	M=D
	@6
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Main.fibonacci
	0;JMP

(Main$ret.1)

	// add
	@SP
	M=M-1
	A=M
	D=M
	A=A-1
	M=D+M

	// return
	
	// endFrame = LCL
	@LCL
	D=M
	@endFrame
	M=D
	
	// retAddr = *(endFrame - 5)
	@endFrame
	D=M
	@retAddr
	M=D
	@5
	D=A
	@retAddr
	M=M-D
	A=M
	D=M
	@retAddr
	M=D
	
	// *ARG = pop()
	@SP
	M=M-1
	A=M
	D=M
	@ARG
	A=M
	M=D
	
	// SP = ARG + 1
	@ARG
	D=M
	@SP
	M=D+1
	
	// THAT = *(endFrame - 1)
	@endFrame
	D=M
	@THAT
	M=D
	@1
	D=A
	@THAT
	M=M-D
	A=M
	D=M
	@THAT
	M=D
	
	// THIS = *(endFrame - 2)
	@endFrame
	D=M
	@THIS
	M=D
	@2
	D=A
	@THIS
	M=M-D
	A=M
	D=M
	@THIS
	M=D
	
	// ARG = *(endFrame - 3)
	@endFrame
	D=M
	@ARG
	M=D
	@3
	D=A
	@ARG
	M=M-D
	A=M
	D=M
	@ARG
	M=D
	
	// LCL = *(endFrame - 4)
	@endFrame
	D=M
	@LCL
	M=D
	@4
	D=A
	@LCL
	M=M-D
	A=M
	D=M
	@LCL
	M=D
	
	// goto retAddr
	@retAddr
	A=M
	0;JMP


// file Sys

(Sys.init)

	// initialise local variables in function
	// handle function execution

	// push constant 4
	@4
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// call Main.fibonacci 1
	
	// push returnAddress
	@Sys$ret.0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push LCL
	@LCL
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push ARG
	@ARG
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push THIS
	@THIS
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// push THAT
	@THAT
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	
	// ARG = SP - 5 - nArgs
	@SP
	D=M
	@ARG
	M=D
	@6
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Main.fibonacci
	0;JMP

(Sys$ret.0)

// label END
(Sys.init$END)
	// goto END
	@Sys.init$END
	0;JMP

