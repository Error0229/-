#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

using namespace std;
int main() {
  string s;
  cin >> s;
  int l = s.length();
  s = " " + s;
  vector<vector<int>> dp(l + 5, vector<int>(l + 5, 0));
  for (int i = 1; i <= l; i++) {
    dp[i][i] = 1;
  }
  for (int k = 2; k <= l; k++) {
    for (int i = 1; i <= l - k + 1; i++) {
      int j = i + k - 1;
      if (s[i] == s[j]) {
        dp[i][j] = dp[i + 1][j - 1] + 2;
      } else {
        dp[i][j] = max(dp[i + 1][j], dp[i][j - 1]);
      }
    }
  }
  if (dp[1][l] == 1) {
    cout << s[1] << '\n';
    return 0;
  }
  // find the longest palindromic subsequence
  string ans = "";
  int i = 1, j = l;
  do {
    if (dp[i][j - 1] == dp[i][j]) {
      j--;
    } else {
      ans = s[j] + ans;
      i++;
      j--;
      if (dp[i][j] == 1) {
        string tmp = ans;
        reverse(tmp.begin(), tmp.end());
        if (dp[i - 1][j + 1] == 2) {
          ans = tmp + ans;
          break;
        } else {
          ans = tmp + s[j] + ans;
          break;
        }
      }
    }
  } while (1);
  cout << ans << '\n';
}
