#include <stdlib.h>

char *toHex(int num)
{
    static const char HEX[] = "0123456789abcdef";
    char buf[9];                         
    unsigned int n = (unsigned int)num; 
    int i = 8;

    if (n == 0) {
        char *res = malloc(2);
        if (!res) return NULL;
        res[0] = '0';
        res[1] = '\0';
        return res;
    }

    buf[i] = '\0';

    do {
        buf[--i] = HEX[n & 0xF];
        n >>= 4;
    } while (n);

    int len = 8 - i;
    char *res = malloc((size_t)len + 1);
    if (!res) return NULL;

    for (int j = 0; j <= len; ++j)
        res[j] = buf[i + j];

    return res;
}