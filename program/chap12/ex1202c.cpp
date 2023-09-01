#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

void sub1(int *num)
{
	printf("%d\n",*num);
}

void sub2(int num)
{
	printf("%d\n",num);
}

#ifdef __cplusplus
}
#endif
