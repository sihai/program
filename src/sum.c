/*
 * sum.c
 *
 *  Created on: Jan 14, 2012
 *      Author: sihai
 */
#include "fun.h"

int sum(int start, int end)
{
	int i = 0;
	int sum = start;
	for(; i <= end; i++)
	{
		sum = add(sum, i);
	}

	return sum;
}

