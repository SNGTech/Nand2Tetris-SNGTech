#pragma once
#ifndef CODE_WRITER_H
#define CODE_WRITER_H

#include <fstream>
#include <string>
#include <map>
#include "cmd_type.h"

#define PUSH_POINTER "\n@SP\n" \
					 "M=M+1\n"

#define READ_ONE_SNIPPET "@SP\n" \
						 "A=M-1\n"

#define READ_TWO_SNIPPET "@SP\n" \
						 "M=M-1\n" \
						 "A=M\n" \
						 "D=M\n" \
						 "A=A-1\n"

#define NEG_SNIPPET "\n@SP\n" \
					"A=M\n" \
					"M=-M\n"

#define COMPARE_SNIPPET(TYPE, INDEX) std::string(\
					   "D=M-D\n") + std::string(\
					   "@IS_" + std::string(TYPE) + '_' + std::to_string(INDEX)) + std::string("\n" \
					   "D;J" + std::string(TYPE) + "\n") + std::string(\
					   "@NOT_" + std::string(TYPE) + '_' + std::to_string(INDEX)) + std::string("\n" \
					   "0;JMP\n") + std::string(\
					   "\n(IS_" + std::string(TYPE) + '_' + std::to_string(INDEX) + ')') + std::string("\n" \
   					   "	@SP\n" \
					   "	A=M-1\n" \
					   "	M=1\n") + std::string(\
					   "	@" + std::string(TYPE) + "_DONE_" + std::to_string(INDEX)) + std::string("\n" \
					   "	0;JMP\n") + std::string(\
					   "(NOT_" + std::string(TYPE) + '_' + std::to_string(INDEX) + ')') + std::string("\n" \
					   "	@SP\n" \
					   "	A=M-1\n" \
				       "	M=0\n") + std::string(\
					   '(' + std::string(TYPE) + "_DONE_" + std::to_string(INDEX) + ')') + "\n"

#define PUSH_CONSTANT_SNIPPET(INDEX) std::string(\
									 '@' + std::to_string(INDEX)) + std::string("\n" \
									 "D=A\n" \
									 "@SP\n" \
									 "A=M\n" \
									 "M=D\n")

class CodeWriter
{
public:
	CodeWriter(std::string asmFilePath);
	void writeArithmetic(const std::string cmd);
	void writePush(const std::string segment, int index);
	void writePop(const std::string segment, int index);
	void close(); 
private:
	std::ofstream m_AsmStream;
	std::map<ArithmeticType, int> m_LabelIndices = {
		{ArithmeticType::Eq, 0},
		{ArithmeticType::Gt, 0},
		{ArithmeticType::Lt, 0}
	};
};

#endif