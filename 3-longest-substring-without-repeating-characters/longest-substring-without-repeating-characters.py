class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        self.string = s
        
        sub = ""
        max_length = 0

        for i in range(len(self.string)):

            if self.string[i] not in sub:
                sub = sub + self.string[i]
                if len(sub) > max_length:
                    max_length = len(sub)
            else:
                pos = sub.rfind(self.string[i])
                sub = sub[pos+1:]

                sub = sub + self.string[i]

        return max_length
                
            