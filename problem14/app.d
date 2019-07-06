// https://projecteuler.net/problem=14

import std.algorithm;
import std.range;
import std.stdio;

struct CollatzRange
{
	this(ulong start)
	{
		value = start;
	}

	bool empty() const @property
	{
		return value == 0;
	}

	void popFront()
	{
		if (value==1) {
			value = 0;
		} else {
			value = (value % 2 == 0) ? value / 2 : 3 * value + 1;	
		}
	}

	ulong front() const @property
	{
		return value;
	}

	ulong value;
}

unittest
{
	assert(equal(CollatzRange(13), [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]));
	assert(walkLength(CollatzRange(13)) == 10);
}

void main() {
	size_t maxLen, maxN;
	foreach(n; iota(1, 1_000_000)) {
		size_t len = walkLength(CollatzRange(n));
		if (len > maxLen) {
			maxLen = len;
			maxN = n;
		}
	}
	writeln(maxN);
}