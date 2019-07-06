// https://projecteuler.net/problem=21

import std.algorithm;
import std.array;
import std.math;
import std.range;
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

bool amicable(size_t index, long[] sums)
{
	size_t otherIndex = sums[index]-1;
	if (index < 1 || otherIndex >= sums.length) {
		return false;
	} 
	return index != otherIndex && sums[index] == otherIndex+1 && sums[otherIndex] == index+1;
}

unittest
{
	auto primes = sieve(1_000_000);
	long[10_000] divisorSums;
	long totalSum;
	for(int i = 0; i < 10_000; i++) {
		divisorSums[i] = divisorSum(i+1, primes);
	}
	assert(amicable(219, divisorSums));
	assert(divisorSums[219] == 284);
	assert(divisorSums[283] == 220);

	for(int i = 0; i < 10_000; i++) {
		if (amicable(i, divisorSums)) {
			writeln(i+1, " has an amicable number");
			totalSum += divisorSums[i];
		}
	}
	totalSum.writeln;
}