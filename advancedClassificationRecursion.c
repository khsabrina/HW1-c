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
int Reverse(int num,int reverse){
    if(num!=0){
        reverse = reverse*10 + num%10;
        Reverse(num/10,reverse);
    }
    else{
        return reverse;
    }
}
int isPalindrome(int num){
    int reverse_num = Reverse(num,0);
    if(reverse_num==num){
        return 1;
    }
    else{
        return 0;
    }
}
int isArmstrongRec2(int num,int digits,int sum){
    if(num!=0){
        sum = sum + pow(num%10,digits);
        isArmstrongRec2(num/10,digits,sum);
    }
    else{
    return sum;
    }
}
int isArmstrong(int num){
    if(isArmstrongRec2(num,NumberOfDigits(num),0)==num){
        return 1;
    }
    return 0;

}