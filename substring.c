//First partner's name: Lingfei Lu, A91046735
//Second partner's name: Junxi Li, A91105747
#include <stdio.h>
#include "substring.h"
#include <string.h>

int substring(char *s1, char *s2)
{
	int i  = 0, j = 0;
	//check if two strings are null
	if(s1 == NULL || s2 == NULL)
		return 0;
	if(strlen(s1) == 0 || strlen(s2) == 0)
		return 1;
	//always let s2 points to the longer character array
	if(strlen(s1) > strlen(s2))
	{
		char *temp = s2;
		s2 = s1;
		s1 = temp;
		
	}
	
	//if we haven't reach the end of the array
	while(s2[i] != 0)
	{
		//if the first element of s1 matches some element in s2
		if(s2[i] == s1[0])
		{
			j = 0;
			//check is s1 reach the end, s2 reach the end and if element in s1
			//match element in s2
			while ((s1[j] & s2[i+j]) && (s1[j] == s2[i+j]))
			{
				j++;
			}

			//if reach the end after while loop, return 1 to indicate success
			if(s1[j] == 0)
			{
				return 1;
			}
		}
		i++;
	}
	//otherwise return 0 to indicate failure
	return 0;	
}