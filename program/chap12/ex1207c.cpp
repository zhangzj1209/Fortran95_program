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

void getinteger(int num);
void getstring(char *a, int len);
void getperson(person p);

#ifdef __cplusplus
}
#endif

void main(void)
{
	char str[] = "Hello";
	person p = { 20, 70.0f, 170.0f };
	
	getinteger( 3 );
	getstring( str, strlen(str) );
	getperson( p );
}