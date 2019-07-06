// https://projecteuler.net/problem=12

import std.algorithm : group;
import std.array : assocArray;
import std.stdio : writeln;

import utils : primeFactors, sieve;

auto divisors(ulong x, ulong[] primes)
{
	auto groupedPrimes = primeFactors(x, primes).group.assocArray;
	size_t ret = 1; 
	foreach(prime, exponent; groupedPrimes) {
		ret *= (1 + exponent);
	}
	return ret;
}

unittest
{
	auto primes = sieve(1_000_000);
	assert(divisors(1, primes) == 1);
	assert(divisors(3, primes) == 2);
	assert(divisors(6, primes) == 4);
	assert(divisors(10, primes) == 4);
	assert(divisors(15, primes) == 4);
	assert(divisors(21, primes) == 4);
	assert(divisors(28, primes) == 6);
}

ulong tri(size_t n)
{
	return (n * (n+1)/2);
}

unittest
{
	assert(tri(1) == 1);
	assert(tri(2) == 3);
	assert(tri(7) == 28);
}

void main()
{
	auto primes = sieve(10_000_000);
	size_t n;
	size_t c;
	while(++n > 0) {
		ulong t = tri(n);
		size_t d = divisors(t, primes);
		if (d > c) {
			writeln("New record: ", t, " has ", d, " divisors!");
			c = d;
			if (c > 500) {
				break;
			}
		}
	}
}