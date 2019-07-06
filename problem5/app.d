// https://projecteuler.net/problem=5

import std.range : iota;
import std.stdio : writeln;

bool isEvenlyDivisible(ulong x, ulong n)
{
	foreach(y; iota(1, n+1)) {
		if (x % y != 0) {
			return false;
		}
	}
	return true;
}

void main()
{
	foreach(number; iota(2521, 1_000_000_000)) {
		if (isEvenlyDivisible(number, 20)) {
			writeln(number);
			return;
		}
	}
}

unittest
{
	assert(isEvenlyDivisible(2520, 10));
}