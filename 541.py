class Solution:
    def reverseStr(self, s: str, k: int) -> str:
        parts = [s[i : i + k] for i in range(0, len(s), k)]

        for i in range(0, len(parts), 2):
            parts[i] = parts[i][::-1]

        return "".join(parts)
