// https://projecteuler.net/?problem=19

import std.algorithm;
import std.datetime;
import std.stdio;

struct DateRange
{
	this(Date start, Date end) 
	{
		current_ = start;
		end_ = end;
		current_.writeln;
		end_.writeln;
	}

	bool empty() const @property 
	{
		return current_ >= end_;
	}

	void popFront() 
	{
		current_.add!"months"(1);
	}

	Date front() const @property
	{
		return current_;
	}

	Date current_;
	Date end_;
}

void main()
{
	// Monday = January 1st 1900
	// Sunday -> daysSinceEpoch() % 7 == 6 && dayOfMonth(daysSinceEpoch()) == 1
	DateRange(Date(1901, 1, 1), Date(2000, 12, 30)).filter!(d => (d.day == 1 && d.dayOfWeek == DayOfWeek.sun)).count!("true").writeln;
}