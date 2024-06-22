#include <iostream>
#include <string>
#include <fstream>
#include "parser.h"
#include "code_writer.h"
#include "utils.h"

int main(int argc, char* argv[])
{
	std::string programPath = argv[1];
	std::vector<std::string> vmFiles;

	CodeWriter codeWriter(programPath);

	if (isPathDirectory(programPath)) 
	{
		vmFiles = getFilesInDirectory(programPath);
		codeWriter.writeBootstrap();
	}
	else
		vmFiles.push_back(programPath);

	for(std::string vmFile : vmFiles) 
	{
		codeWriter.setFileName(vmFile);
		Parser parser(vmFile);
		while (parser.hasMoreCommands())
		{
			parser.nextCommand();

			CommandType cmdType = parser.getCommandType();
			std::string arg1 = parser.getArg1();
			int arg2 = parser.getArg2();
			//std::cout << (int)parser.getCommandType() << ":\t" << arg1 << "\t" << arg2 << "\t" << parser.isInLabel() << std::endl;

			codeWriter.setInLabel(parser.isInLabel());
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
			case CommandType::C_Function:
				codeWriter.writeFunction(arg1, arg2);
				break;
			case CommandType::C_Call:
				codeWriter.writeCall(arg1, arg2);
				break;
			case CommandType::C_Return:
				codeWriter.writeReturn();
				break;
			}
		}
		parser.close();
	}

	codeWriter.close();
	return 0;
}