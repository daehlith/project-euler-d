// https://projecteuler.net/problem=1

import std.functional;
import std.stdio;

ulong fib(ulong n) @safe
{
	return n < 2 ? n : memoize!fib(n-2) + memoize!fib(n-1);
}

void main()
{
	ulong s = 0;
	ulong n = 1;
	while (true)
	{
		auto x = fib(n++);
		if (x % 2 == 0) {
			s += x;
		}
		if (x > 4_000_000) {
			break;
		}
	}
	writeln(s);
}