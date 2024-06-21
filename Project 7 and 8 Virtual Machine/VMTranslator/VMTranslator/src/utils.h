#pragma once
#ifndef UTILS_H

#include <regex>
#include <vector>
#include <sstream>

// function trim taken from StackOverflow
// https://stackoverflow.com/a/36000453 
static void trim(std::string &str)
{
	// right trim
	while (str.length() > 0 && (str[str.length() - 1] == ' ' || str[str.length() - 1] == '\t'))
		str.erase(str.length() - 1, 1);

	// left trim
	while (str.length() > 0 && (str[0] == ' ' || str[0] == '\t'))
		str.erase(0, 1);
}

static std::vector<std::string> split(const std::string &str, char delimiter)
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
