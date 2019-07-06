// https://projecteuler.net/problem=1

import std.algorithm.iteration;
import std.conv;
import std.stdio;
import std.range;

void main()
{
	writeln(iota(0, 1000).filter!(i => (i % 3 == 0) || (i % 5 == 0)).sum);
}