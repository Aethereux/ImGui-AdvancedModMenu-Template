#include "StringH.hpp"

std::string StringH::boolToStr(bool flag) {
	return flag ? "True" : "False";
}

std::vector<std::string> StringH::split(std::string s, std::string delimiter) {
	std::vector<std::string> splitArray;

	size_t pos = 0;
	std::string token;
	while ((pos = s.find(delimiter)) != std::string::npos) {
		token = s.substr(0, pos);
		splitArray.push_back(token);
		s.erase(0, pos + delimiter.length());
	}
	splitArray.push_back(s);

	return splitArray;
}

bool StringH::equalsIgnoreCase(std::string a, std::string b) {
	return std::equal(a.begin(), a.end(), b.begin(), b.end(), [](char a, char b) {
		return tolower(a) == tolower(b);
		});
}

std::string StringH::strToBytes(std::string s) {
	std::string out{};
	for (char& c : s) {
		out += std::to_string((int)c) + " ";
	}
	out.pop_back();
	return out;
}

std::string StringH::bytesToStr(std::string s) {
	std::vector<std::string> numbers = split(s, " ");
	std::string out{};
	for (int i = 0; i < numbers.size(); i++) {
		out += (char)std::stoi(numbers.at(i));
	}
	return out;
}

std::string StringH::getFileNameFromPath(std::string s) {
	int i1 = s.find_last_of("\\");

	std::string out = s.substr(i1 + 1);
	out = out.substr(0, out.find_last_of("."));
	return out;
}
