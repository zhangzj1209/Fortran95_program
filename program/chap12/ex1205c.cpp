#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

void _stdcall SUB(int *a);

#ifdef __cplusplus
}
#endif

void main(void)
{
	int a=10;
	SUB(&a);
}