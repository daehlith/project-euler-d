module utils;

import std.algorithm;
import std.math;
import std.range;

auto sieve(ulong n) // of Eratosthenes
{
	// create a list of all prime numbers up to n
	bool[] a; // array of boolean values
	a.length = n+1; // pre-allocate
	a[] = true; // and assume that all are prime numbers
	a[0] = a[1] = false; // account for 0 and 1 not being prime numbers

	auto m = lround(ceil(sqrt(real(n))));
	foreach(i; 2..m) {
		if (a[i]) {
			auto j = i*i;
			while(j <= n)
			{
				a[j] = false;
				j += i;
			}
		}
	}
	ulong[] prime_numbers;
	foreach(number, is_prime; enumerate(a)){
		if (is_prime) {
			prime_numbers ~= number;
		}
	}
	return prime_numbers;
}

unittest
{
	assert(sieve(5) == [2, 3, 5]);
	assert(sieve(6) == [2, 3, 5]);
	assert(sieve(20) == [2, 3, 5, 7, 11, 13, 17, 19]);
	assert(sieve(271) == [
		2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 
		73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 
		157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 
		239, 241, 251, 257, 263, 269, 271
	]);
}

auto primeFactors(ulong x, ulong[] primeNumbers = sieve(10_000_000))
{
	ulong[] prime_factors;
	if (x > 2) {
		foreach(prime_number; primeNumbers)
		{
			while((x % prime_number) == 0) {
				prime_factors ~= prime_number;
				x /= prime_number;
			}
			if (prime_number * prime_number > x) {
				break;
			}
		}
		if (x > 1) {
			prime_factors ~= x;
		}
	}
	return prime_factors;
}

unittest
{
	assert(primeFactors(13195) == [5, 7, 13, 29]);
	assert(primeFactors(13915) == [5, 11, 11, 23]);
}

ulong foldingTriangleSum(int[][] numberTriangle) 
{
	for(int i = cast(int)numberTriangle.length - 2; i > -1; --i) {
		for(size_t j = 0; j < numberTriangle[i].length; ++j) {
			numberTriangle[i][j] += max(numberTriangle[i+1][j], numberTriangle[i+1][j+1]);
		}
	}
	return numberTriangle[0][0];
}

unittest
{
	int[][] testNumbers = [
		[3],
		[7, 4],
		[2, 4, 6],
		[8, 5, 9, 3],
	];
	assert(foldingTriangleSum(testNumbers) == 23);
}

auto divisors(ulong n, ulong[] sieve)
{
	auto primes = primeFactors(n, sieve).group.assocArray;
	long[] factors;
	foreach(prime, exponent; primes) {
		for(int i = 1; i <= exponent; ++i) {
			auto d = lround(pow(prime, i));
			if (d * d <= n) {
				factors ~= d;
			}
		}
	}
	long[] ret = factors;
	foreach(f; factors) {
		foreach(g; factors) {
			auto x = f*g;
			if (x * x <= n && n % x == 0) {
				ret ~= x;
				ret ~= n / x;
			}
		}
		ret ~= n / f;
	}
	ret ~= 1;
	ret.sort;
	ret = ret.uniq.array;
	return ret;
}

unittest
{
	auto primeSieve = sieve(1_000_000);
	assert(divisors(12, primeSieve) == [1, 2, 3, 4, 6]);
	assert(divisors(220, primeSieve) == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]);
	assert(divisors(284, primeSieve) == [1, 2, 4, 71, 142]);
}