#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

void sub1(char *num)
{
	printf("%s\n",num);
}

void sub2(float r, float i)
{
	printf("%5.2f, %5.2f\n",r, i);
}

typedef struct _person
{
  int   age;
  float weight, height;
} person;

void sub3(person p)
{
	printf("age:%d weight:%5.2f height:%5.2f\n", 
		    p.age, p.weight, p.height);
}

#ifdef __cplusplus
}
#endif
