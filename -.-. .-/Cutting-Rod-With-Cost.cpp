#include <iostream>
#include <vector>

#define int long long
using namespace std;
signed main() {
  int n;
  vector<int> price;
  vector<int> dp(10005);
  cin >> n;
  for (auto i = 0; i < n; i++) {
    int x;
    cin >> x;
    price.push_back(x);
    dp[i] = x;
  }
  for (int i = 0; i < n; i++) {
    int maximum = dp[i];
    for (int j = 0; j < i; j++) {
      maximum = max(maximum, dp[i - j - 1] + price[j]);
    }
    dp[i] = maximum;
  }
  cout << dp[n - 1] << '\n';
}
