/* ********************************
 * CSE 30 - HW 4
 * ********************************/

#include <stdio.h>
#include "majority_count.h"

int main(int argc, char ** argv) {

    int data[] = {1, 1, 1, 2};
    int data1[] = {1, 2, 3, 4};
    int data2[] = {1,1,1,1,2,2,2,2};
    int data3[] = {4,2,1,4,3,4,5,4,4};
    int data4[] = {2};
    int data5[] = {2,2};
    int data6[] = {3,1,1};
    int data7[] = {2,3,1,1,2,2};
    int c_majority, arm_majority;
    int c_count = majority_count
    (data, 4, &c_majority);
    int arm_count = majority_count_ARM(data, 4, &arm_majority);

    printf("C   Majority Count  : %d\n", c_count);
    printf("C   Majority Element: %d\n", c_majority);
    printf("ARM Majority Count  : %d\n", arm_count);
    printf("ARM Majority Element: %d\n", arm_majority);

    c_count = majority_count(data1, 4, &c_majority);
    arm_count = majority_count_ARM(data1, 4, &arm_majority);

    printf("C   Majority Count  : %d\n", c_count);
    printf("C   Majority Element: %d\n", c_majority);
    printf("ARM Majority Count  : %d\n", arm_count);
    printf("ARM Majority Element: %d\n", arm_majority);

    c_count = majority_count(data2, 8, &c_majority);
    arm_count = majority_count_ARM(data2, 8, &arm_majority);

    printf("C   Majority Count  : %d\n", c_count);
    printf("C   Majority Element: %d\n", c_majority);
    printf("ARM Majority Count  : %d\n", arm_count);
    printf("ARM Majority Element: %d\n", arm_majority);

    c_count = majority_count(data3, 9, &c_majority);
    arm_count = majority_count_ARM(data3, 9, &arm_majority);

    printf("C   Majority Count  : %d\n", c_count);
    printf("C   Majority Element: %d\n", c_majority);
    printf("ARM Majority Count  : %d\n", arm_count);
    printf("ARM Majority Element: %d\n", arm_majority);
    
    
    arm_count = majority_count_ARM(data4, 1, &arm_majority);
    printf("ARM Majority Element: %d\n", arm_majority);
    arm_count = majority_count_ARM(data5, 2, &arm_majority);
    printf("ARM Majority Element: %d\n", arm_majority);
    arm_count = majority_count_ARM(data6, 3, &arm_majority);
    printf("ARM Majority Element: %d\n", arm_majority);
    arm_count = majority_count_ARM(data7, 7, &arm_majority);
    printf("ARM Majority Element: %d\n", arm_majority);
    
    


    return 0;
}
