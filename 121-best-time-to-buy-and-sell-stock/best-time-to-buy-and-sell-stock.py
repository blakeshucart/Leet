import math 

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        self.prices = prices

        min_price = math.inf

        max_profit = 0

        for price in self.prices:
            if price < min_price:
                min_price = price

            else:
                profit = price - min_price
                if profit > max_profit:
                    max_profit = profit

        return max_profit
        