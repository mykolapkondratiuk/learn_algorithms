//
//  main.c
//  MaxSquareRectBy2DArray_by_C
//
//  Created by Mykola Kondratyuk on 3/4/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//


// Program to find maximum sum subarray in a given 2D array
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <stdlib.h>
#define ROW 4
#define COL 5

// Implementation of Kadane's algorithm for 1D array. The function
// returns the maximum sum and stores starting and ending indexes of the
// maximum sum subarray at addresses pointed by start and finish pointers
// respectively.
int kadane(int* arr, int* start, int* finish, int n)
{
    // initialize sum, maxSum and
    int sum = 0, maxSum = INT_MIN, i;

    // Just some initial value to check for all negative values case
    *finish = -1;

    // local variable
    int local_start = 0;

    for (i = 0; i < n; ++i)
    {
        sum += arr[i];
        if (sum < 0)
        {
            sum = 0;
            local_start = i+1;
        }
        else if (sum > maxSum)
        {
            maxSum = sum;
            *start = local_start;
            *finish = i;
        }
    }

    // There is at-least one non-negative number
    if (*finish != -1)
        return maxSum;

    // Special Case: When all numbers in arr[] are negative
    maxSum = arr[0];
    *start = *finish = 0;

    // Find the maximum element in array
    for (i = 1; i < n; i++)
    {
        if (arr[i] > maxSum)
        {
            maxSum = arr[i];
            *start = *finish = i;
        }
    }
    return maxSum;
}

// The main function that finds maximum sum rectangle in M[][]
void findMaxSum(int M[][COL])
{
    // Variables to store the final output
    int maxSum = INT_MIN, finalLeft, finalRight, finalTop, finalBottom;

    int left, right, i;
    int temp[ROW], sum, start, finish;

    // Set the left column
    for (left = 0; left < COL; ++left)
    {
        // Initialize all elements of temp as 0
        memset(temp, 0, sizeof(temp));

        // Set the right column for the left column set by outer loop
        for (right = left; right < COL; ++right)
        {
        // Calculate sum between current left and right for every row 'i'
            for (i = 0; i < ROW; ++i)
                temp[i] += M[i][right];

            // Find the maximum sum subarray in temp[]. The kadane()
            // function also sets values of start and finish. So 'sum' is
            // sum of rectangle between (start, left) and (finish, right)
            // which is the maximum sum with boundary columns strictly as
            // left and right.
            sum = kadane(temp, &start, &finish, ROW);

            // Compare sum with maximum sum so far. If sum is more, then
            // update maxSum and other output values
            if (sum > maxSum)
            {
                maxSum = sum;
                finalLeft = left;
                finalRight = right;
                finalTop = start;
                finalBottom = finish;
            }
        }
    }

    // Print final values
    printf("(Top, Left) (%d, %d)\n", finalTop, finalLeft);
    printf("(Bottom, Right) (%d, %d)\n", finalBottom, finalRight);
    printf("Max sum is: %d\n", maxSum);
}

//  Use a (dynamically allocated) array of pointers to (dynamically allocated) arrays.
//  This is used mostly when the array bounds are not known until runtime.
void func(int** array, int rows, int cols)
{
  int i, j;

  for (i=0; i<rows; i++)
  {
    for (j=0; j<cols; j++)
    {
      array[i][j] = i*j;
    }
  }
}



// n must be passed before the 2D array - work!!!
void print(int m, int n, int arr[][n])
{
    int i, j;
    for (i = 0; i < m; i++)
    {
      for (j = 0; j < n; j++)
      {
          printf("%d ", arr[i][j]);
      }
      printf("\n");
    }
}

void findMaxSquareOfRectangle(int number_rows, int number_columns, int M[][number_columns])
{
    // Variables to store the final output
    int maxSum = INT_MIN, finalLeft, finalRight, finalTop, finalBottom;

    int left, right, i;
    int temp[number_rows], sum, start, finish;

    // Set the left column
    for (left = 0; left < number_columns; ++left)
    {
        // Initialize all elements of temp as 0
        memset(temp, 0, sizeof(temp));

        // Set the right column for the left column set by outer loop
        for (right = left; right < number_columns; ++right)
        {
        // Calculate sum between current left and right for every row 'i'
            for (i = 0; i < number_rows; ++i)
                temp[i] += M[i][right];

            // Find the maximum sum subarray in temp[]. The kadane()
            // function also sets values of start and finish. So 'sum' is
            // sum of rectangle between (start, left) and (finish, right)
            // which is the maximum sum with boundary columns strictly as
            // left and right.
            sum = kadane(temp, &start, &finish, number_rows);

            // Compare sum with maximum sum so far. If sum is more, then
            // update maxSum and other output values
            if (sum > maxSum)
            {
                maxSum = sum;
                finalLeft = left;
                finalRight = right;
                finalTop = start;
                finalBottom = finish;
            }
        }
    }

    // Print final values
    printf("(Top, Left) (%d, %d)\n", finalTop, finalLeft);
    printf("(Bottom, Right) (%d, %d)\n", finalBottom, finalRight);
    printf("Max sum is: %d\n", maxSum);
}




// Driver program to test above functions
int main()
{
    
    int M[ROW][COL] = {
                       {1, 2, -1, -4, -20},
                       {-8, -3, 4, 2, 1},
                       {3, 8, 10, 1, 3},
                       {-4, -1, 1, 7, -6}
                    };

    findMaxSum(M);
    
    findMaxSquareOfRectangle( 4, 5, M);
    
    
    int matrix[4][5] = {
       {1, 1, 1, 1, 0},
       {1, 1, 0, 1, 0},
       {1, 1, 0, 0, 0},
       {0, 0, 0, 0, 0}
    };
    
    int m = 4, n = 5;
    print(m, n,  matrix);
    
    
    findMaxSquareOfRectangle( 4, 5, matrix);
    
    
    /*
    int r = 3, c = 4;
    int *arr = (int *)malloc(r * c * sizeof(int));
    
    int i, j, count = 0;
    for (i = 0; i <  r; i++)
    {
        for (j = 0; j < c; j++)
        {
           *(arr + i*c + j) = ++count;
        }
    }
    
    for (i = 0; i <  r; i++)
    {
        for (j = 0; j < c; j++)
        {
           printf("%d ", *(arr + i*c + j));
        }
        printf("\n");
    }
    
    // deallocate the array
    for (i = 0; i < r; i++)
    {
      //free(arr[i]);
    }
    
    free(arr);
     */

    return 0;
}





/*
int main(int argc, const char * argv[]) {
    int rows, cols, i;
    int **x;

    // obtain values for rows & cols
    
    rows = 4;
    cols = 5;
    
    // allocate the array *
    x = malloc(rows * sizeof *x);
    
    for (i=0; i<rows; i++)
    {
      x[i] = malloc(cols * sizeof *x[i]);
    }

    // use the array
    func(x, rows, cols);

    // deallocate the array
    for (i=0; i<rows; i++)
    {
      free(x[i]);
    }
    free(x);
}
*/
