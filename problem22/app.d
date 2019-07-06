// https://projecteuler.net/problem=22

import std.algorithm;
import std.array;
import std.range;
import std.stdio;

ulong score(string name, size_t index)
{
	ulong nameSum;
	for (size_t i = 0; i < name.length; ++i) {
		nameSum += name.ptr[i] - 64;
	}
	return index * nameSum;
}

unittest
{
	assert(score("COLIN", 938) == 49_714);

	auto names = File("problem22.txt").readln.split(",");
	names.sort;
	names = names.map!(name => name[1..$-1]).array;
	names.length.writeln;
	names[937].writeln;
	assert(names[937] == "COLIN");
	ulong sum;
	foreach(lineNum, line; names.enumerate(1)) {
		sum += score(line, lineNum);
	}
	sum.writeln;
}