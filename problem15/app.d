// https://projecteuler.net/problem=15

import std.algorithm;
import std.range;
import std.stdio;

ulong binomialCoefficient(int n, int k)
{
	if (n < 0 || k > n) {
		return 0;
	}

	if (k == 0 || n == k) {
		return 1;
	}

	k = min(k, n-k);
	ulong c = 1;
	foreach(i; iota(0, k)) {
		c = c * (n-i) / (i + 1);
	}
	return c;
}

unittest
{
	assert(binomialCoefficient(4, 2) == 6);
}

void main()
{
	writeln(binomialCoefficient(40, 20));
}