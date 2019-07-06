// https://projecteuler.net/problem=13
/* The numbers are located in problem13.txt
The idea is to do good, old fashioned digit by digit addition,
going from the right to the left. Just like we did back in math
class.
solution = 3550353422647252425087405407559178978126433033169000
*/

import std.algorithm : all, reverse;
import std.conv;
import std.stdio;

const(char)[] add(string[] numbers)
{
	char[] sum;
	int carry;
	for(long digit = (numbers[0].length-1); digit >= 0; --digit) {
		int accumulator = carry;
		foreach(number; numbers) {
			writeln(number);
			accumulator += number[digit]-48;
		}
		sum ~= to!string(accumulator % 10);
		carry = accumulator / 10;
	}

	if (carry > 0) {
		sum ~= to!string(carry);
	}

	return sum.length > 0 ? sum : "0"; // don't forget to reverse, or we need to read right to left!
}

unittest
{
	assert(add(["1", "1"]) == "2");
	assert(add(["51", "60"]).dup.reverse == "111");
	assert(add(["76", "05", "13"]).dup.reverse == "94");
	assert(add(["12345", "67890", "45678"]).dup.reverse == "125913");
	assert(add(["9", "9", "9", "9", "9", "9"]).dup.reverse == "54");
}

void main()
{
	auto f = new File();
	f.open("problem13.txt", "r");
	string[] numbers;
	foreach(number; f.byLineCopy) {
		numbers ~= number;
	}
	writeln(add(numbers).dup.reverse);
}