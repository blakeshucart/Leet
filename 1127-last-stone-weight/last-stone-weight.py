import heapq

class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        self.min_heap = [-x for x in stones]
        
        heapq.heapify(self.min_heap)

        while len(self.min_heap) > 1:
            a = self.min_heap[0]
            heapq.heappop(self.min_heap)
            b = self.min_heap[0]
            heapq.heappop(self.min_heap)

            res = a-b

            if res != 0:
                heapq.heappush(self.min_heap, res)

        return abs(self.min_heap[0]) if self.min_heap else 0

        