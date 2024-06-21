#include "code_writer.h"
#include "utils.h"
#include <iostream>
#include <sstream>

CodeWriter::CodeWriter(std::string asmFilePath)
{
	m_AsmStream = std::ofstream(asmFilePath);
	m_FileName = split(asmFilePath, '/').back();
	m_FileName = m_FileName.substr(0, m_FileName.find(".asm"));
}

void CodeWriter::writeArithmetic(const std::string cmd)
{
	std::string snippet = "";
	if (cmd == arithmeticTypes[ArithmeticType::Add])
	{
		snippet = "// add\n" \
				  READ_TWO_SNIPPET \
				  "M=D+M\n";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Sub])
	{
		snippet = "// sub\n" \
				  READ_TWO_SNIPPET \
				  "M=M-D\n";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Neg])
	{
		snippet = "// neg\n" \
			READ_ONE_SNIPPET \
			"M=-M\n";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Eq])
	{
		snippet = "// eq\n"
			READ_TWO_SNIPPET +
			COMPARE_SNIPPET("EQ", m_LabelIndices[ArithmeticType::Eq]);
		m_LabelIndices[ArithmeticType::Eq]++;
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Gt])
	{
		snippet = "// gt\n"
			READ_TWO_SNIPPET +
			COMPARE_SNIPPET("GT", m_LabelIndices[ArithmeticType::Gt]);
		m_LabelIndices[ArithmeticType::Gt]++;
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Lt])
	{
		snippet = "// lt\n"
			READ_TWO_SNIPPET +
			COMPARE_SNIPPET("LT", m_LabelIndices[ArithmeticType::Lt]);
		m_LabelIndices[ArithmeticType::Lt]++;
	}
	else if (cmd == arithmeticTypes[ArithmeticType::And]) 
	{
		snippet = "// and\n" \
			READ_TWO_SNIPPET \
			"M=D&M\n";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Or])
	{
		snippet = "// or\n" \
			READ_TWO_SNIPPET \
			"M=D|M\n";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Not])
	{
		snippet = "// not\n" \
			READ_ONE_SNIPPET \
			"M=!M\n";
	}
	
	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writePush(const std::string segment, int index)
{
	std::string snippet = "";
	
	if (segment == segments[Segment::CONSTANT]) 
	{
		snippet = "// push constant " + std::to_string(index) + '\n' +
			ADDRESS_CONSTANT_SNIPPET(index) +
			PUSH_SNIPPET;
	}
	else if (segment == segments[Segment::LOCAL])
	{
		snippet = "// push local " + std::to_string(index) + '\n' +
			ADDRESS_LOCAL_SNIPPET(index) +
			PUSH_SEGMENT_SNIPPET +
			PUSH_SNIPPET;
	}
	else if (segment == segments[Segment::ARGUMENT])
	{
		snippet = "// push argument " + std::to_string(index) + '\n' +
			ADDRESS_ARGUMENT_SNIPPET(index) +
			PUSH_SEGMENT_SNIPPET +
			PUSH_SNIPPET;
	}
	else if (segment == segments[Segment::THIS])
	{
		snippet = "// push this " + std::to_string(index) + '\n' +
			ADDRESS_THIS_SNIPPET(index) +
			PUSH_SEGMENT_SNIPPET +
			PUSH_SNIPPET;
	}
	else if (segment == segments[Segment::THAT])
	{
		snippet = "// push that " + std::to_string(index) + '\n' +
			ADDRESS_THAT_SNIPPET(index) +
			PUSH_SEGMENT_SNIPPET +
			PUSH_SNIPPET;
	}
	else if (segment == segments[Segment::TEMP])
	{
		snippet = "// push temp " + std::to_string(index) + '\n' +
			ADDRESS_TEMP_SNIPPET(index) +
			PUSH_SEGMENT_SNIPPET +
			PUSH_SNIPPET;
	}
	else if (segment == segments[Segment::STATIC])
	{
		snippet = "// push static " + std::to_string(index) + '\n' +
			PUSH_STATIC_SNIPPET(m_FileName, index);
	}
	else if (segment == segments[Segment::POINTER])
	{
		snippet = "// push pointer " + std::to_string(index) + '\n' +
			PUSH_POINTER_SNIPPET(index);
	}

	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writePop(const std::string segment, int index)
{
	std::string snippet = "";

	if (segment == segments[Segment::LOCAL])
	{
		snippet = "// pop local " + std::to_string(index) + '\n' +
			ADDRESS_LOCAL_SNIPPET(index) +
			POP_SEGMENT_SNIPPET +
			POP_SNIPPET;
	}
	else if (segment == segments[Segment::ARGUMENT])
	{
		snippet = "// pop argument " + std::to_string(index) + '\n' +
			ADDRESS_ARGUMENT_SNIPPET(index) +
			POP_SEGMENT_SNIPPET +
			POP_SNIPPET;
	}
	else if (segment == segments[Segment::THIS])
	{
		snippet = "// pop this " + std::to_string(index) + '\n' +
			ADDRESS_THIS_SNIPPET(index) +
			POP_SEGMENT_SNIPPET +
			POP_SNIPPET;
	}
	else if (segment == segments[Segment::THAT])
	{
		snippet = "// pop that " + std::to_string(index) + '\n' +
			ADDRESS_THAT_SNIPPET(index) +
			POP_SEGMENT_SNIPPET +
			POP_SNIPPET;
	}
	else if (segment == segments[Segment::TEMP])
	{
		snippet = "// pop temp " + std::to_string(index) + '\n' +
			ADDRESS_TEMP_SNIPPET(index) +
			POP_SEGMENT_SNIPPET +
			POP_SNIPPET;
	}
	else if (segment == segments[Segment::STATIC])
	{
		snippet = "// pop static " + std::to_string(index) + '\n' +
			POP_STATIC_SNIPPET(m_FileName, index);
	}
	else if (segment == segments[Segment::POINTER])
	{
		snippet = "// pop pointer " + std::to_string(index) + '\n' +
			POP_POINTER_SNIPPET(index);
	}

	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writeLabel(const std::string label)
{
	std::string snippet = std::string("// label " + label + "\n" + \
		                              "(" + label + ")");
	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writeGoto(const std::string label)
{
	std::string snippet = std::string("// goto " + label + "\n" + \
									  "@" + label + "\n") + std::string(\
									  "0;JMP\n");
	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writeIf(const std::string label)
{
	std::string snippet = std::string("// if-goto " + label + "\n") + std::string(\
		                  "@SP\n" \
		                  "A=M-1\n" \
		                  "D=M\n") + std::string(\
		                  "@" + label + "\n") + std::string(\
						  "0;JEQ\n");
	m_AsmStream << snippet << std::endl;
}

void CodeWriter::close()
{
	m_AsmStream.close();
	std::cout <<
		"\nTranslated VM to ASM Successfully" <<
		std::endl;
}