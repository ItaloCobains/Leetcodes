#include <stdio.h>

#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define INF 1000000

int solve(int *a, int n) {
    int dp[n + 1][2];

    for (int i = 0; i <= n; i++) {
        dp[i][0] = dp[i][1] = INF;
    }

    dp[0][0] = 0;

    for (int i = 0; i < n; i++) {
        for (int turn = 0; turn < 2; turn++) {
            if (dp[i][turn] >= INF) continue;

            for (int moves = 1; moves <= 2 && i + moves <= n; moves++) {
                int cost = 0;

                if (turn == 0) {
                    for (int k = i; k < i + moves; k++) {
                        cost += a[k];
                    }
                }

                int next_turn = 1 - turn;
                dp[i + moves][next_turn] = MIN(dp[i + moves][next_turn], dp[i][turn] + cost);
            }
        }
    }

    return MIN(dp[n][0], dp[n][1]);
}

int main(void) {
    int cases;
    scanf("%d", &cases);

    while (cases--) {
        int n;
        scanf("%d", &n);

        int a[n];
        for (int i = 0; i < n; i++) {
            scanf("%d", &a[i]);
        }

        printf("%d\n", solve(a, n));
    }

    return 0;
}