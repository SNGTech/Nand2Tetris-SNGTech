#include <iostream>
#include <string>
#include <fstream>
#include "parser.h"
#include "code_writer.h"

int main() 
{
	Parser parser("res/08/BasicLoop.vm");
	CodeWriter codeWriter("res/translated/BasicLoop.asm");

	while (parser.hasMoreCommands())
	{
		parser.nextCommand();

		CommandType cmdType = parser.getCommandType();
		std::string arg1 = parser.getArg1();
		int arg2 = parser.getArg2();
		std::cout << (int)parser.getCommandType() << ":\t" << arg1 << "\t" << arg2 << "\t" << parser.isInLabel() << std::endl;

		switch (cmdType)
		{
			case CommandType::C_Arithmetic:
				codeWriter.writeArithmetic(arg1);
				break;
			case CommandType::C_Push:
				codeWriter.writePush(arg1, arg2);
				break;
			case CommandType::C_Pop:
				codeWriter.writePop(arg1, arg2);
				break;
			case CommandType::C_Label:
				codeWriter.writeLabel(arg1);
				break;
			case CommandType::C_Goto:
				codeWriter.writeGoto(arg1);
				break;
			case CommandType::C_If:
				codeWriter.writeIf(arg1);
				break;
		}
	}

	parser.close();
	codeWriter.close();
	return 0;
}