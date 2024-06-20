#pragma once
#ifndef CMD_TYPE_H
#define CMD_TYPE_H

#include <string>
#include <map>

enum class CommandType
{
	C_Arithmetic,
	C_Push,
	C_Pop,
	C_Label,
	C_Goto,
	C_If,
	C_Function,
	C_Call,
	C_Return,
	C_Invalid
};

enum class ArithmeticType
{
	Add,
	Sub,
	Neg,
	Eq,
	Gt,
	Lt,
	And,
	Or,
	Not
};

static std::map<ArithmeticType, std::string> arithmeticTypes = {
	{ArithmeticType::Add, "add"},
	{ArithmeticType::Sub, "sub"},
	{ArithmeticType::Neg, "neg"},
	{ArithmeticType::Eq, "eq"},
	{ArithmeticType::Gt, "gt"},
	{ArithmeticType::Lt, "lt"},
	{ArithmeticType::And, "and"},
	{ArithmeticType::Or, "or"},
	{ArithmeticType::Not, "not"}
};

#endif
