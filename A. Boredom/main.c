#include <stdio.h>

#define MAX 100001
#define ll long long

int main (int argc, char *argv[]) {
    int n;
    scanf("%d", &n);

    ll cnt[MAX] = {0};
    int max_val = 0;

    for (int i = 0; i < n; i++) {
        int a;
        scanf("%d", &a);
        cnt[a]++;
        if (a > max_val) max_val = a;
    }

    ll dp[MAX] = {0};
    dp[1] = cnt[1];

    for (int x = 2; x <= max_val; x++)
    {
        ll pega = dp[x - 2] + (ll)x * cnt[x];
        ll nao_pega = dp[x - 1];
        dp[x] = pega > nao_pega ? pega : nao_pega;
    }

    printf("%lld\n", dp[max_val]);
    return 0;
}