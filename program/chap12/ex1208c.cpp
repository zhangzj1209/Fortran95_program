#include <stdio.h>
#include <string.h>

typedef struct _person
{
	int   age;
	float weight, height;
} person;

#ifdef __cplusplus
extern "C" {
#endif

void _stdcall SUB1(int *num)
{
	printf("%d\n",*num);
}

void _stdcall SUB2(char *a, int len)
{
	a[len]='\0';
	printf("%s\n",a);
}

void _stdcall SUB3(person *p)
{
	printf("age:%d weight:%5.1f height:%5.1f\n", 
		    p->age, p->weight, p->height);
}

#ifdef __cplusplus
}
#endif