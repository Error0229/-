#include <iostream>
#include <vector>
using namespace std;
int main() {
  int n;
  cin >> n;
  vector<int> c(n + 5, 0);
  vector<int> dp(n + 5, 0);
  for (int i = 1; i <= n; i++) {
    cin >> c[i];
  }
  int cost = 0;
  dp[1] = c[1];
  for (int i = 2; i <= n; i++) {
    int minimum = 1e9;
    for (int j = i - 1; j >= 1; j--) {
      minimum = min(minimum, dp[j] + (j - i) * (j - i - 1) / 2);
    }
    dp[i] = minimum + c[i];
  }
  cout << dp[n] << '\n';
}
