// https://projecteuler.net/problem=7

import std.stdio : writeln;
import utils : sieve;

void main()
{
	auto prime_numbers = sieve(100_000_000);
	writeln(prime_numbers[10000]);
}