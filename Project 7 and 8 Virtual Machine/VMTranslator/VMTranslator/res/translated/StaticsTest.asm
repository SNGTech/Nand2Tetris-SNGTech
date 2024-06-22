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


// file Class1

(Class1.set)

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

	// pop static 0
	@SP
	M=M-1
	A=M
	D=M
	@Class1.0
	M=D

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

	// pop static 1
	@SP
	M=M-1
	A=M
	D=M
	@Class1.1
	M=D

	// push constant 0
	@0
	D=A
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

(Class1.get)

	// initialise local variables in function
	// handle function execution

	// push static 0
	@Class1.0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push static 1
	@Class1.1
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


// file Class2

(Class2.set)

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

	// pop static 0
	@SP
	M=M-1
	A=M
	D=M
	@Class2.0
	M=D

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

	// pop static 1
	@SP
	M=M-1
	A=M
	D=M
	@Class2.1
	M=D

	// push constant 0
	@0
	D=A
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

(Class2.get)

	// initialise local variables in function
	// handle function execution

	// push static 0
	@Class2.0
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push static 1
	@Class2.1
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


// file Sys

(Sys.init)

	// initialise local variables in function
	// handle function execution

	// push constant 6
	@6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push constant 8
	@8
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// call Class1.set 2
	
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
	@7
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Class1.set
	0;JMP

(Sys$ret.0)

	// pop temp 0
	@0
	D=A
	@5
	A=D+A
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

	// push constant 23
	@23
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push constant 15
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// call Class2.set 2
	
	// push returnAddress
	@Sys$ret.1
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
	@7
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Class2.set
	0;JMP

(Sys$ret.1)

	// pop temp 0
	@0
	D=A
	@5
	A=D+A
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

	// call Class1.get 0
	
	// push returnAddress
	@Sys$ret.2
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
	@Class1.get
	0;JMP

(Sys$ret.2)

	// call Class2.get 0
	
	// push returnAddress
	@Sys$ret.3
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
	@Class2.get
	0;JMP

(Sys$ret.3)

// label END
(Sys.init$END)
	// goto END
	@Sys.init$END
	0;JMP

