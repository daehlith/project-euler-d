// https://projecteuler.net/problem=16

import std.algorithm;
import std.array;
import std.bigint;
import std.conv;
import std.stdio;
import std.utf;

ulong powerDigitSum(int base, int exponent)
{
	BigInt power = base;
	while(--exponent) {
		power *= base;
	}

	return map!(d => d - 48)(to!string(power).dup).sum;
}

unittest
{
	assert(powerDigitSum(2, 15) == 26);
}

void main()
{
	powerDigitSum(2, 1000).writeln;
}