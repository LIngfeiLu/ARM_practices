/* ********************************
 * CSE 30 - HW 4
 *
 * This file is merely designed to give you an idea how to compile/test your own
 * code. You may modify it as you like.
 *
 * ********************************/

#include <stdio.h>

int str_to_int(char * str, int * dest);

int main(int argc, char ** argv) {
    int x;
    	printf("%d\n", str_to_int("123", &x));
        printf("%d\n", x);
		printf("%d\n", str_to_int("-123", &x));
        printf("%d\n", x);
        printf("%d\n", str_to_int("a123", &x));
        printf("%d\n", x);
        printf("%d\n", str_to_int("123b", &x));
        printf("%d\n", x);
        printf("%d\n", str_to_int(NULL, &x));
        printf("%d\n", x);
        printf("%d\n", str_to_int("123", NULL));
        printf("%d\n", x);
        printf("%d\n", str_to_int("", &x));
        printf("%d\n", x);
        //printf(str_to_int(187236, &x));
        //printf("%d\n", x);
        //printf(str_to_int(sadiaos, &x));
        //printf("%d\n", x);
    return 0;
}
