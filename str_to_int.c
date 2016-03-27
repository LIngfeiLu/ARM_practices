//First partner's name: Lingfei Lu, A91046735
//Second partner's name: Junxi Li, A91105747
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/* str_to_int change the character representation of integer to integer
 */
int str_to_int(char*s, int*dest)
{
	int power = 1, i = 0, temp = 0, limit=0;
	//if inputs are null, then return 0 to indicate failure
	if(s == NULL || dest == NULL || *s == 0)
		return 0;
	
	//if character array represent a negative number, then parse the array until
	//reach index 1
	if(*s == '-')
		limit=1;

	//loop the array from the last element to the limit, if integer is positive
	//then loop utill index 0, is integer is negative, then loop utill index 1.
	for(i = (int)strlen(s)-1; i >=limit; i--)
	{
		//transfrom character representation of number to integer representation
		//of number
		int num = *(s+i)-48;
		//check if num is valid decimal number, return null if invalid
		if(num > 9 || num < 0)
			return 0;
		//compose the number
		temp += num * power;
		power *= 10;
	}

	//if limit is 1, then num is negative, get its opposite
	if(limit == 1)
		temp = 0 - temp;
	
	//point int pointer to int temp
	*dest = temp;
	//return 1 to indicate success
	return 1;
}