#include "code_writer.h"
#include <iostream>
#include <sstream>

CodeWriter::CodeWriter(std::string asmFilePath)
{
	m_AsmStream = std::ofstream(asmFilePath);
}

void CodeWriter::writeArithmetic(const std::string cmd)
{
	std::string snippet = "";
	if (cmd == arithmeticTypes[ArithmeticType::Add])
	{
		snippet = "// add\n" \
				  READ_TWO_SNIPPET \
				  "M=D+M";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Sub])
	{
		snippet = "// sub\n" \
				  READ_TWO_SNIPPET \
				  "M=M-D";
	}
	else if (cmd == arithmeticTypes[ArithmeticType::Neg])
	{
		snippet = "// neg\n" \
			READ_ONE_SNIPPET
			NEG_SNIPPET;
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
	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writePush(const std::string segment, int index)
{
	std::string snippet = "// push constant " + std::to_string(index) + '\n' +
					  PUSH_CONSTANT_SNIPPET(index) + 
					  PUSH_POINTER;

	m_AsmStream << snippet << std::endl;
}

void CodeWriter::writePop(const std::string segment, int index)
{

}

void CodeWriter::close()
{
	m_AsmStream.close();
	std::cout <<
		"\nTranslated VM to ASM Successfully" <<
		std::endl;
}