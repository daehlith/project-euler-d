// https://projecteuler.net/problem=20

import std.algorithm;
import std.bigint;
import std.conv;
import std.stdio;

void main()
{
	BigInt fac = 100;
	for(int i = 1; i < 100; ++i) {
		fac *= i;
	}
	map!(d => d - 48)(to!string(fac).idup).sum.writeln;
}