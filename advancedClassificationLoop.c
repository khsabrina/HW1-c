
#include <stdio.h>
#include "NumClass.h"
#include <math.h>

int NumberOfDigits(int num){
    int count =0;
    while ( num > 0){
        count = count +1;
        num = num /10;   
    }
    return count;
}
int isArmstrong(int num){
    int count_digit = NumberOfDigits(num);
    int copy_num=num;
    int sum = 0;
    int i=0;
    for ( i = 0; i < count_digit; i++)
    {
        sum = sum + pow(num % 10,count_digit);
        num=num/10;
    }
    if(sum == copy_num){
        return 1;
    }
    return 0;
 
}
int isPalindrome(int num){
    int if_pali = 0;
    int last_digit=0;
    int reverse_number=0;
    int num_copy=num;
    while(num_copy >0){
        last_digit= num_copy%10;
        reverse_number=reverse_number*10 + last_digit;
        num_copy=num_copy/10;
    }
    if(reverse_number==num){
        return 1;
    }
    return 0;

}