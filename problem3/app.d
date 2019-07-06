// https://projecteuler.net/problem=3

import std.algorithm : maxElement;
import std.stdio;

import utils : primeFactors;

void main() 
{
	writeln(primeFactors(600_851_475_143).maxElement);
}