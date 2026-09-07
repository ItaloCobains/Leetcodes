#include <iostream>
#include <optional>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

class Solution {
public:
  vector<string> findWords(vector<string> &words) {
    vector<string> result;
    vector<string> rows = {"qwertyuiop", "asdfghjkl", "zxcvbnm"};
    unordered_map<char, size_t> rowOf;

    for (int i = 0; i < 3; i++) {
      for (char c : rows[i]) {
        rowOf[c] = i;
      }
    }

    for (const string &word : words) {
      optional<int> prev;
      bool block = false;
      for (char c : word) {
        size_t index = rowOf[tolower(static_cast<unsigned char>(c))];

        if (prev && index != prev) {
          block = true;
          break;
        }

        if (!prev) {
          prev = index;
        }
      }

      if (!block) {
        result.push_back(word);
      }
    }

    return result;
  }
};

static void printWords(const vector<string> &words) {
  cout << "[";
  for (size_t i = 0; i < words.size(); i++) {
    if (i > 0)
      cout << ", ";
    cout << "\"" << words[i] << "\"";
  }
  cout << "]";
}

static bool runTest(const string &name, vector<string> input,
                    const vector<string> &expected) {
  Solution solution;
  vector<string> got = solution.findWords(input);

  bool pass = got == expected;
  cout << (pass ? "PASS" : "FAIL") << " " << name << "\n";
  cout << "  input:    ";
  printWords(input);
  cout << "\n  expected: ";
  printWords(expected);
  cout << "\n  got:      ";
  printWords(got);
  cout << "\n";
  return pass;
}

int main() {
  int failed = 0;

  failed += !runTest("example 1", {"Hello", "Alaska", "Dad", "Peace"},
                     {"Alaska", "Dad"});
  failed += !runTest("example 2", {"omk"}, {});
  failed += !runTest("example 3", {"adsdf", "sfd"}, {"adsdf", "sfd"});
  failed += !runTest("single letter", {"z"}, {"z"});
  failed += !runTest("mixed case same row", {"QWERTY"}, {"QWERTY"});
  failed += !runTest("cross rows", {"ab"}, {});

  if (failed == 0)
    cout << "All tests passed\n";
  else
    cout << failed << " test(s) failed\n";

  return failed == 0 ? 0 : 1;
}
