// https://projecteuler.net/problem=5

import std.algorithm : sum;
import std.range : iota;
import std.stdio : writeln;

ulong sumSquare(ulong n)
{
	ulong ret;
	foreach(i; 1..n+1) {
		ret += i*i;
	}
	return ret;
}

ulong squareSum(ulong n)
{
	ulong ret = iota(1, 1+n).sum;
	return ret*ret;
}

void main()
{
	writeln(squareSum(100) - sumSquare(100));
}

unittest
{
	assert(sumSquare(10) == 385);
	assert(squareSum(10) == 3025);
	assert(squareSum(10) - sumSquare(10) == 2640);
}