#pragma once
#ifndef UTILS_H

#include <filesystem>
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

static bool isPathDirectory(const std::string path)
{
	struct stat s;
	return stat(path.c_str(), &s) == 0 && s.st_mode & S_IFDIR;
}

static std::vector<std::string> getFilesInDirectory(const std::string directory)
{
	std::vector<std::string> files;
	for (const auto& entry : std::filesystem::directory_iterator(directory)) 
	{
		std::filesystem::path filename = entry.path();
		std::string filename_str = filename.string();
		files.push_back(filename_str);
	}

	return files;
}

static std::string getFileNameFromPath(const std::string path)
{
	std::string fileName = path.substr(path.find_last_of("/\\") + 1);
	return fileName.substr(0, fileName.find(".vm"));
}

#endif // !UTILS_H
