// https://projecteuler.net/problem=4

import std.algorithm.mutation : reverse;
import std.conv;
import std.stdio;

bool isPalindrome(string value)
{
	auto maybePalindrome = value.dup;
	auto odd = (value.length % 2);
	size_t half = value.length / 2;
	reverse(maybePalindrome[0..half]);
	return maybePalindrome[0..half] == maybePalindrome[half+odd..$];
}

void main()
{
	ulong result = 0;
	for(size_t i = 999; i > 99; i--) {
		for(size_t j = 999; j > 99; j--) {
			if(isPalindrome(to!string(i*j))) {
				if (i*j > result) {
					result = i*j;
				}
			}
		}
	}
	writeln(result);
}

unittest
{
	assert(isPalindrome("racecar"));
	assert(isPalindrome(to!string(1331)));
}