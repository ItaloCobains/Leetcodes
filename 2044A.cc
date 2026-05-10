#include <iostream>
#include <vector>

using namespace std;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int t;
  cin >> t;

  for (int i = 0; i < t; i++) {
    int x, c = 0; cin >> x;

    int x_c = x;

    for (int j = 0; j < x; j++) {
      if (x_c != 1) {
        c++;
        x_c--;
      }
    }

    cout << c << endl;
  }

  return 0;
}
