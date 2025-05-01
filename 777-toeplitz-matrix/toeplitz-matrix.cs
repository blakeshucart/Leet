public class Solution {
    public bool IsToeplitzMatrix(int[][] matrix) {
        int row_count = matrix.Length;
        int col_count =  matrix[0].Length;

        for(int i = 0; i < row_count; i++)
        {
            for(int j = 0; j < col_count; j++)
            {
                if (i != 0 && j != 0 && matrix[i][j] != matrix[i - 1][j - 1])
                {
                    return false;
                }
            }
        }
        return true; 
    }
}