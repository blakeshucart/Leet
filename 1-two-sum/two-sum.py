class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:

        maps = []

        for i in range(len(nums)):
            j = i+1
            while j < len(nums):

                if nums[j] == (target - nums[i]):
                    return [i,j]
                j+=1

        return None