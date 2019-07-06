// https://projecteuler.net/problem=9

import std.math : rndtol, sqrt;
import std.stdio : writeln;

long tripletSum(long a, long b, long c)
{
	return a + b + c;
}

unittest
{
	assert(tripletSum(3, 4, 5) == 12);
}

long tripletProduct(long a, long b, long c)
{
	return a * b * c;
}

unittest
{
	assert(tripletProduct(3, 4, 5) == 60);
}

void main()
{
	for (long a = 1; a < 500; ++a)
	{
		for (long b = a+1; b < 600; ++b)
		{
			real c_squared = a*a + b*b;
			long c = rndtol(sqrt(c_squared));
			if (c_squared == c*c && tripletSum(a, b, c) == 1000 && a < b && b < c) {
				writeln("tripletProduct(", a, ", ", b, ", ", c, ") = ", tripletProduct(a, b, c));
			}
		}
	}
}