#include <iostream>
#include <string>
#include <fstream>
#include "parser.h"
#include "code_writer.h"

int main() 
{
	Parser parser("res/test/test.vm");
	CodeWriter codeWriter("res/translated/test.asm");

	while (parser.hasMoreCommands())
	{
		parser.nextCommand();

		CommandType cmdType = parser.getCommandType();
		std::string arg1 = parser.getArg1();
		int arg2 = parser.getArg2();
		std::cout << (int)parser.getCommandType() << ":\t" << arg1 << "\t" << arg2 << std::endl;

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
		}
	}

	parser.close();
	codeWriter.close();
	return 0;
}