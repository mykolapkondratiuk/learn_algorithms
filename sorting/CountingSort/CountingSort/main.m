//
//  main.m
//  CountingSort
//
//  Created by Mykola Kondratyuk on 2/27/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RANGE 255
//
//  The function that sort the given string arr[] in
//  alphabatical order
//
void charArrayCountSort(char arr[])
{
    // The output character array that will have sorted arr
    char output[strlen(arr)];
  
    // Create a count array to store count of inidividul
    // characters and initialize count array as 0
    int count[RANGE + 1], i;
    memset(count, 0, sizeof(count));
  
    // Store count of each character
    for(i = 0; arr[i]; ++i)
    {
        ++count[arr[i]];
    }
  
    // Change count[i] so that count[i] now contains actual
    // position of this character in output array
    for (i = 1; i <= RANGE; ++i)
    {
        count[i] += count[i-1];
    }
  
    // Build the output character array
    for (i = 0; arr[i]; ++i)
    {
        output[count[arr[i]]-1] = arr[i];
        --count[arr[i]];
    }
  
    /*
     For Stable algorithm
     for (i = sizeof(arr)-1; i>=0; --i)
    {
        output[count[arr[i]]-1] = arr[i];
        --count[arr[i]];
    }
     
    For Logic : See implementation
    */
  
    // Copy the output array to arr, so that arr now
    // contains sorted characters
    for (i = 0; arr[i]; ++i)
    {
        arr[i] = output[i];
    }
}


//  from https://rosettacode.org/wiki/Sorting_algorithms/Counting_sort#C
void counting_sort_mm(int *array, int n, int min, int max)
{
  int i, j, z;
 
  int range = max - min + 1;
  int *count = malloc(range * sizeof(*array));
 
  for(i = 0; i < range; i++)
      count[i] = 0;
  for(i = 0; i < n; i++)
      count[ array[i] - min ]++;
 
  for(i = min, z = 0; i <= max; i++)
  {
    for(j = 0; j < count[i - min]; j++)
    {
      array[z++] = i;
    }
  }
 
  free(count);
}
 
void min_max(int *array, int n, int *min, int *max)
{
  int i;
 
  *min = *max = array[0];
  for(i=1; i < n; i++) {
    if ( array[i] < *min ) {
      *min = array[i];
    } else if ( array[i] > *max ) {
      *max = array[i];
    }
  }
}


@interface SortingAlgorithms:NSObject
//
//  unsorted array contains unsigned value from  : 1, 2, 3, 4, ...
//

- (NSArray *) countingSortArray:(NSArray<NSNumber *> *)unsortedArray
                   withMaxValue:(NSUInteger           )maxRange;

@end

@implementation SortingAlgorithms

- (NSArray *) countingSortArray:(NSArray<NSNumber *> *)unsortedArray
                   withMaxValue:(NSUInteger           )maxRange
{
    return nil;
}

@end

int main(int argc, const char * argv[]) {
    
    char arr[] = "geeksforgeeks";//"applepp";
    
    charArrayCountSort(arr);
    
    printf("Sorted character array is %s\n", arr);
    
    
    int unordered[9] = {1, 5, 200, 5,17, 8, 17,8, 0};
    int ordered[9];
    for (int i = 0; i < 9; i++)
    {
        printf("%d\n", unordered[i]);
    }
    printf("Sorting ...\n");
    //  void counting_sort_mm(int *array, int n, int min, int max)
    counting_sort_mm(unordered, 9, 0, 200);
    //countSort(unordered, 9, ordered);
    for (int i = 0; i < 9; i++)
    {
        printf("%d\n", unordered[i]);
    }
    
    
    /*
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
     */
    
    return 0;
}
