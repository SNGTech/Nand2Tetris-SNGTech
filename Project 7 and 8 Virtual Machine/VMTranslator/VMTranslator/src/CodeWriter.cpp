#include "code_writer.h"
#include "utils.h"
#include <iostream>
#include <sstream>

CodeWriter::CodeWriter(std::string programPath)
{
	m_LabelFunctionPrefixes.push("");
	std::string asmFilePath = "res/translated/" + getFileNameFromPath(programPath) + ".asm";
	m_AsmStream = std::ofstream(asmFilePath);
}

void CodeWriter::writeBootstrap()
{
	m_AsmStream << std::string(\
		"// bootstrap code\n" \
		"@256\n" \
		"D=A\n" \
		"@SP\n" \
		"M=D\n") << std::endl;
	writeCall("Sys.init", 0);
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
	
	write(snippet);
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

	write(snippet);
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

	write(snippet);
}

void CodeWriter::writeLabel(const std::string label)
{
	std::string snippet = std::string("// label " + label + "\n") + \
		                              LABEL_SNIPPET(m_LabelFunctionPrefixes.top() + label);
	m_AsmStream << snippet;
}

void CodeWriter::writeGoto(const std::string label)
{
	std::string snippet = std::string("// goto " + label + "\n") + \
									  GOTO_SNIPPET(m_LabelFunctionPrefixes.top() + label);
	write(snippet);
}

void CodeWriter::writeIf(const std::string label)
{
	std::string snippet = std::string("// if-goto " + label + "\n") + std::string(\
		                  "@SP\n" \
		                  "M=M-1\n" \
						  "A=M\n" \
		                  "D=M\n") + std::string(\
		                  "@" + m_LabelFunctionPrefixes.top() + label + "\n") + std::string(\
						  "D+1;JEQ\n" \
						  "D;JGT\n");
	write(snippet);
}

void CodeWriter::writeFunction(const std::string functionName, int nVars)
{
	std::string snippet = LABEL_SNIPPET(functionName) + "\n" \
						  "\t// initialise local variables in function\n";

	for (int i = 0; i < nVars; i++)
	{
		snippet += INIT_LOCAL + "\n";
	}

	snippet += "\t" + std::string("// handle function execution\n");

	write(snippet);

	if (m_LabelFunctionPrefixes.top() != functionName + "$")
		m_LabelFunctionPrefixes.push(functionName + "$");
}

void CodeWriter::writeReturn()
{
	std::string snippet = std::string(\
						  "// return\n") + \
		                  END_FRAME + \
						  RESTORE_VALUE("retAddr", 5) + \
						  POP_ARG0 + \
						  REPOSITION_SP + \
						  RESTORE_VALUE("THAT", 1) + \
						  RESTORE_VALUE("THIS", 2) + \
						  RESTORE_VALUE("ARG", 3) + \
						  RESTORE_VALUE("LCL", 4) + \
						  GOTO_RETURN_ADDRESS;
					
	write(snippet);
}

void CodeWriter::writeCall(const std::string functionName, int nArgs)
{
	std::string returnLabel = m_FileName + "$ret." + std::to_string(m_ReturnIndex);
	std::string snippet = std::string(\
						"// call " + functionName + " " + std::to_string(nArgs) + "\n") + \
						SAVE_RETURN_ADDRESS(returnLabel) + \
						SAVE_SEGMENT("LCL") + \
						SAVE_SEGMENT("ARG") + \
						SAVE_SEGMENT("THIS") + \
						SAVE_SEGMENT("THAT") + \
						REPOSITION_ARG(nArgs) + \
						REPOSITION_LCL + \
						GOTO_SNIPPET(functionName);
	write(snippet);
	m_AsmStream << LABEL_SNIPPET(returnLabel) << std::endl;
	m_ReturnIndex++;
}

void CodeWriter::write(const std::string str) 
{
	std::istringstream strStream(str);
	std::string line;
	while (std::getline(strStream, line, '\n'))
	{
		m_AsmStream << std::string(m_CurrentCommandInLabel ? "\t" : "") + line + "\n";
	}

	m_AsmStream << std::endl;
}

void CodeWriter::setFileName(const std::string filePath)
{
	m_FileName = getFileNameFromPath(filePath);
	m_ReturnIndex = 0;
	m_AsmStream << std::endl << "// file " << m_FileName << std::endl << std::endl;
}

void CodeWriter::close()
{
	m_AsmStream.close();
	std::cout <<
		"\nTranslated VM to ASM Successfully" <<
		std::endl;
}