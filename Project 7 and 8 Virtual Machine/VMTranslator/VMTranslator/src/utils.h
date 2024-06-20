#pragma once
#ifndef UTILS_H

#include <regex>
#include <vector>
#include <sstream>

void trim(std::string &str)
{
	std::regex_replace(str, std::regex{ R"(^\s+|\s+$)" }, "");
}

std::vector<std::string> split(const std::string &str, char delimiter)
{
	std::istringstream strStream(str);
	std::string token;
	std::vector<std::string> v;
	while (std::getline(strStream, token, delimiter))
	{
		v.push_back(token);
	}

	return v;
}

#endif // !UTILS_H
