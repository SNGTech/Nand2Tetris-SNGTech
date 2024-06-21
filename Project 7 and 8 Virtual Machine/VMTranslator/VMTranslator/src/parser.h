#pragma once
#ifndef PARSER_H
#define PARSER_H

#include <fstream>
#include <string>
#include "cmd_type.h"

class Parser
{
public:
	Parser(std::string vmFilePath);

	void nextCommand();
	bool hasMoreCommands();
	CommandType getCommandType();
	bool isInLabel();
	std::string getArg1();
	int getArg2();
	std::string getCommand() { return m_CurrentCommand; };
	void close();

private:
	std::ifstream m_VMStream;
	std::string m_CurrentCommand = "";
	bool m_CurrentCommandInLabel = false;
};

#endif
