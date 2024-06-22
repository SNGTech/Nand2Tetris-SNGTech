(SimpleFunction.test)
	// initialise local variables in function
	@SP
	A=M
	M=0
	@SP
	M=M+1

	@SP
	A=M
	M=0
	@SP
	M=M+1

	// handle function execution

	// push local 0
	@0
	D=A
	@LCL
	A=D+M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push local 1
	@1
	D=A
	@LCL
	A=D+M
	D=M
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

	// not
	@SP
	A=M-1
	M=!M

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

	// add
	@SP
	M=M-1
	A=M
	D=M
	A=A-1
	M=D+M

	// push argument 1
	@1
	D=A
	@ARG
	A=D+M
	D=M
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

