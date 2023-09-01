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

void _stdcall GETSTRING(char *a, int len);
void _stdcall GETPERSON(person *p);

#ifdef __cplusplus
}
#endif

void main(void)
{
	char str[] = "Hello";
	person p = { 20, 70.0f, 170.0f };

	GETSTRING( str, strlen(str) );
	GETPERSON( &p );
}