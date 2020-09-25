#include <stdio.h>
#include <stdlib.h>

extern int calculator(int lhs, int rhs, char op[]);

int main()
{
    int lhs;
    scanf("%d",&lhs);
    int rhs;
    scanf("%d",&rhs);
    char *op;
    op = malloc(2*sizeof(char));
    scanf("%s",op);
    int eredmeny;
    eredmeny = calculator(lhs,rhs,op);
    printf("Az eredmény: %d\n",eredmeny);
    return 0;
}
