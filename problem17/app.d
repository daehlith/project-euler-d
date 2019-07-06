// https://projecteuler.net/problem=17

import std.stdio;

string[19] words = [
	"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve",
	"thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
];

string[8] ties = [
	"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
];

string toWords(int number)
{
	assert(0 < number && number <= 1000);
	if (number == 1000) {
		return "onethousand";
	} else if (0 < number && number < 20) {
		return words[number-1];
	} else if (number / 100 > 0) {
		auto ret = toWords(number / 100) ~ "hundred";
		if (number % 100 > 0) {
			ret ~= "and" ~ toWords(number % 100);
		}
		return ret;
	} else {
		auto ret = ties[number / 10 - 2]; 
		if (number % 10 > 0) {
			ret ~= toWords(number % 10);
		}
		return ret;
	}
}

unittest
{
	assert(toWords(1).length == 3);
	assert(toWords(342).length == 23);
	assert(toWords(115).length == 20);
	assert(toWords(1000) == "onethousand");
}

void main()
{
	size_t len;
	for(int i = 1; i <= 1000; ++i) {
		len += toWords(i).length;
	}
	len.writeln;
}