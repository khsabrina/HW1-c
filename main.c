#include <stdio.h>
#include "NumClass.h"
#include <math.h>

int main(){
    int num1;
    int num2;
    int swap;
    scanf("%d %d",&num1,&num2);
    if(num2>num1){
        swap=num1;
        num1=num2;
        num2=swap;
    }
    int i;
    int j;
    for (i=1;i<=4;i++){
        for(j=num2;j<=num1;j++){
            if(i==1 && isPrime(j)==1){
                printf("%d ",j);
            }
            if(i==2 && isArmstrong(j)==1){
                printf("%d ",j);
            }
            if(i==3 && isStrong(j)==1){
                printf("%d ",j);
            }
            if(i==4 && isPalindrome(j)==1){
                printf("%d ",j);
            }
        
        }
        printf("\n");
    }
}