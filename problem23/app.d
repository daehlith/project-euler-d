// https://projecteuler.net/problem=23

import std.stdio;

import utils;

auto divisorSum(ulong n, ulong[] primes)
{
	ulong s;
	auto divs = divisors(n, primes);
	foreach(d; divs) {
		s += d;
	}
	return s;
}

void main()
{
	auto primes = sieve(1_000_000);

	assert(divisorSum(12, primes) == 16); // first abundant number
	assert(divisorSum(28, primes) == 28); // perfect number

	//Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.	
	ulong sum;
	for(int i = 1; i < 20162; ++i) {
		if (divisorSum(i, primes) <= i) {
			sum += i; // this is the sum of all non-abundant numbers
		}
	}
	sum.writeln;
}