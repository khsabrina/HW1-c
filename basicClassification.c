#include <stdio.h>
#include "NumClass.h"
#include <math.h>

int isPrime(int num){
    int count = 0;
    int i;
    for (i=2 ; i<=num/2; ++i){
        if (num % i == 0){
            count = count + 1;
        }
    }
    if(count == 0 ){
        return 1;
    }
    else return 0;
}
int isStrong(int num){
    int ten = 10 ;
    int sum= 0;
    int factorial=1;
    int check = num;
    while (num > 0){
        int digit = num%ten;
        if(digit==0){
            factorial=1;
        }
        for(int i = 1; i<=digit; ++i){
            factorial = factorial *i;
        } 
        sum = sum + factorial;
        factorial = 1;
        num = num / ten;

        
    }
    if(check == sum){
        return 1;
    }
    return 0;
}
