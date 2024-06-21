#pragma once
#ifndef CODE_WRITER_H
#define CODE_WRITER_H

#include <fstream>
#include <string>
#include <map>
#include "cmd_type.h"

/* --------------- ARITHMETIC --------------- */

#define READ_ONE_SNIPPET "@SP\n" \
						 "A=M-1\n"

#define READ_TWO_SNIPPET "@SP\n" \
						 "M=M-1\n" \
						 "A=M\n" \
						 "D=M\n" \
						 "A=A-1\n"

#define COMPARE_SNIPPET(TYPE, INDEX) std::string(\
					   "D=M-D\n") + std::string(\
					   "@IS_" + std::string(TYPE) + '_' + std::to_string(INDEX)) + std::string("\n" \
					   "D;J" + std::string(TYPE) + "\n") + std::string(\
					   "@NOT_" + std::string(TYPE) + '_' + std::to_string(INDEX)) + std::string("\n" \
					   "0;JMP\n") + std::string(\
					   "\n(IS_" + std::string(TYPE) + '_' + std::to_string(INDEX) + ')') + std::string("\n" \
   					   "	@SP\n" \
					   "	A=M-1\n" \
					   "	M=-1\n") + std::string(\
					   "	@" + std::string(TYPE) + "_DONE_" + std::to_string(INDEX)) + std::string("\n" \
					   "	0;JMP\n") + std::string(\
					   "(NOT_" + std::string(TYPE) + '_' + std::to_string(INDEX) + ')') + std::string("\n" \
					   "	@SP\n" \
					   "	A=M-1\n" \
				       "	M=0\n") + std::string(\
					   '(' + std::string(TYPE) + "_DONE_" + std::to_string(INDEX) + ')') + "\n"

/* --------------- MEMORY SEGMENT --------------- */

#define PUSH_SNIPPET "@SP\n" \
					 "A=M\n" \
                     "M=D\n" \
					 "@SP\n" \
					 "M=M+1\n"

#define POP_SNIPPET "@segment\n" \
					"M=D\n" \
					"@SP\n" \
					"M=M-1\n" \
					"A=M\n" \
					"D=M\n" \
					"@segment\n" \
					"A=M\n" \
					"M=D\n"

#define PUSH_SEGMENT_SNIPPET "D=M\n"
#define POP_SEGMENT_SNIPPET "D=A\n"

#define ADDRESS_CONSTANT_SNIPPET(INDEX) std::string(\
									 "@" + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n")

#define ADDRESS_LOCAL_SNIPPET(INDEX) std::string(\
									 "@" + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n" \
									 "@LCL\n" \
									 "A=D+M\n")

#define ADDRESS_ARGUMENT_SNIPPET(INDEX) std::string(\
									 "@" + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n" \
									 "@ARG\n" \
									 "A=D+M\n")

#define ADDRESS_THIS_SNIPPET(INDEX) std::string(\
									 "@" + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n" \
									 "@THIS\n" \
									 "A=D+M\n")

#define ADDRESS_THAT_SNIPPET(INDEX) std::string(\
									 "@" + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n" \
									 "@THAT\n" \
									 "A=D+M\n")
									 
#define ADDRESS_TEMP_SNIPPET(INDEX) std::string(\
									 "@" + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n" \
									 "@5\n" \
									 "A=D+A\n")

#define PUSH_POINTER_SNIPPET(THIS_OR_THAT) std::string(\
									 THIS_OR_THAT == 0 ? "@THIS" : "@THAT") + std::string("\n" \
									 "D=M\n") + \
									 PUSH_SNIPPET

#define POP_POINTER_SNIPPET(THIS_OR_THAT) std::string(\
									 "@SP\n" \
									 "M=M-1\n" \
									 "A=M\n" \
									 "D=M\n") + std::string(\
									 THIS_OR_THAT == 0 ? "@THIS" : "@THAT") + std::string("\n" \
									 "M=D\n")

#define PUSH_STATIC_SNIPPET(FILENAME, INDEX) std::string(\
									 "@" + FILENAME + "." + std::to_string(INDEX)) + std::string("\n" \
									 "D=M\n") + \
									 PUSH_SNIPPET

#define POP_STATIC_SNIPPET(FILENAME, INDEX) std::string(\
									 "@SP\n" \
									 "M=M-1\n" \
									 "A=M\n" \
									 "D=M\n") + std::string(\
									 "@" + FILENAME + "." + std::to_string(INDEX)) + std::string("\n" \
									 "M=D\n")

class CodeWriter
{
public:
	CodeWriter(std::string asmFilePath);
	void writeArithmetic(const std::string cmd);
	void writePush(const std::string segment, int index);
	void writePop(const std::string segment, int index);
	void writeLabel(const std::string label);
	void writeGoto(const std::string label);
	void writeIf(const std::string label);
	void close(); 
private:
	std::ofstream m_AsmStream;
	std::string m_FileName;
	std::map<ArithmeticType, int> m_LabelIndices = {
		{ArithmeticType::Eq, 0},
		{ArithmeticType::Gt, 0},
		{ArithmeticType::Lt, 0}
	};
};

#endif