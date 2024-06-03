#include <iostream>
#include <string>

using namespace std;

class Solution {
public:
    int lengthOfLastWord(string s) {
        int count = 0;
        bool foundLastWord = false;

        for (int i = s.length() - 1; i >= 0; i--) {
            if (s[i] != ' ') {
                count++;
                foundLastWord = true;
            } else if (foundLastWord) {
                break;
            }
        }

        return count;
    }
};

int main() {
    Solution solution;
    string s = "   fly me   to   the moon  ";
    int result = solution.lengthOfLastWord(s);

    cout << result << endl;
    return 0;
}