// https://projecteuler.net/problem=10

import std.algorithm : sum;
import std.stdio : writeln;

import utils : sieve;

void main()
{
	auto prime_numbers = sieve(2_000_000);
	writeln(prime_numbers.sum);
}