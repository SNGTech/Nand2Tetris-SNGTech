#include "parser.h"
#include "utils.h"
#include <iostream>

Parser::Parser(std::string vmFilePath)
{
	m_VMStream = std::ifstream(vmFilePath);
}

void Parser::nextCommand()
{
	std::string line = "";
	do
	{
		std::getline(m_VMStream, line);
		trim(line);
		if (line.find("//") != std::string::npos)
		{
			line = line.substr(0, line.find_first_of("//"));
		}
	} while (line.empty());

	m_CurrentCommand = line;
}

bool Parser::hasMoreCommands()
{
	return m_VMStream.peek() != EOF;
}

CommandType Parser::getCommandType()
{
	std::string arg0 = split(m_CurrentCommand, ' ')[0];

	for (auto& acmd : arithmeticTypes)
		if (arg0 == acmd.second)
			return CommandType::C_Arithmetic;

	if (arg0 == "push")
		return CommandType::C_Push;
	else if (arg0 == "pop")
		return CommandType::C_Pop;
	else if (arg0 == "label")
		return CommandType::C_Label;
	else if (arg0 == "goto")
		return CommandType::C_Goto;
	else if (arg0 == "if")
		return CommandType::C_If;
	else if (arg0 == "function")
		return CommandType::C_Function;
	else if (arg0 == "call")
		return CommandType::C_Call;
	else if (arg0 == "return")
		return CommandType::C_Return;
	else
		return CommandType::C_Invalid;
}

std::string Parser::getArg1()
{
	CommandType cmdType = getCommandType();
	if (cmdType == CommandType::C_Return)
		return "null";

	std::string cmd = cmdType == CommandType::C_Arithmetic
		? split(m_CurrentCommand, ' ')[0] : split(m_CurrentCommand, ' ')[1];
	return cmd;
}

int Parser::getArg2()
{
	CommandType cmdType = getCommandType();
	if (cmdType == CommandType::C_Push ||
		cmdType == CommandType::C_Pop ||
		cmdType == CommandType::C_Function ||
		cmdType == CommandType::C_Call)
		return std::stoi(split(m_CurrentCommand, ' ')[2]);

	return -1;
}

void Parser::close()
{
	m_VMStream.close();
	std::cout <<
		"----------------------------------\n" <<
		"Closed VM File Stream Successfully" <<
		std::endl;
}