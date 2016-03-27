/* ********************************
 * CSE 30 - HW 3
 * ********************************/

#include <stdio.h>
#include "substring.h"

int main() {
    
    char *s1 = "CSE30";
    char *s2 = "SE3";
    char *s3 = "se3";
    char *s4 = "";
    char *s5 = "";
    printf("%d\n",substring(s1, s2));
    printf("%d\n",substring(s2, s1));
    printf("%d\n",substring(s1, s1));
    printf("%d\n", substring(s1, s3));
    printf("%d\n", substring(s2, s3));
    printf("%d\n", substring(s1, s4));
    printf("%d\n", substring(s4, s5));
    return 0;
}
