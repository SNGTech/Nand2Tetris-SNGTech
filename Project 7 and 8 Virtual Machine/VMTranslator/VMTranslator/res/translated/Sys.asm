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


// file Sys

(Sys.init)

	// initialise local variables in function
	// handle function execution

	// push constant 4000
	@4000
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop pointer 0
	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	// push constant 5000
	@5000
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop pointer 1
	@SP
	M=M-1
	A=M
	D=M
	@THAT
	M=D

	// call Sys.main 0
	
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
	@5
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Sys.main
	0;JMP

(Sys$ret.0)

	// pop temp 1
	@1
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

// label LOOP
(LOOP)
	// goto LOOP
	@LOOP
	0;JMP

(Sys.main)

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

	@SP
	A=M
	M=0
	@SP
	M=M+1

	// handle function execution

	// push constant 4001
	@4001
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop pointer 0
	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	// push constant 5001
	@5001
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop pointer 1
	@SP
	M=M-1
	A=M
	D=M
	@THAT
	M=D

	// push constant 200
	@200
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop local 1
	@1
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

	// push constant 40
	@40
	D=A
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

	// push constant 6
	@6
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop local 3
	@3
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

	// push constant 123
	@123
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// call Sys.add12 1
	
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
	@6
	D=A
	@ARG
	M=M-D
	
	// LCL = SP
	@SP
	D=M
	@LCL
	M=D
	@Sys.add12
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

	// push local 3
	@3
	D=A
	@LCL
	A=D+M
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// push local 4
	@4
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

	// add
	@SP
	M=M-1
	A=M
	D=M
	A=A-1
	M=D+M

	// add
	@SP
	M=M-1
	A=M
	D=M
	A=A-1
	M=D+M

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

(Sys.add12)

	// initialise local variables in function
	// handle function execution

	// push constant 4002
	@4002
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop pointer 0
	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	// push constant 5002
	@5002
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1

	// pop pointer 1
	@SP
	M=M-1
	A=M
	D=M
	@THAT
	M=D

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

	// push constant 12
	@12
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

