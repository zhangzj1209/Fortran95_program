#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

int func(int num[2][2])
{
    int i,j;
    int s=0;
    for ( i=0; i<2; i++ )
    {
        for ( j=0; j<2; j++ )
        {
            s+=num[i][j];
        }
    }
    return s;
}

#ifdef __cplusplus
}
#endif
