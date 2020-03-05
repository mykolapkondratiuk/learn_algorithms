//
//  main.swift
//  QuickSortFromRossetacodeSwift
//
//  Created by Mykola Kondratyuk on 2/22/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

import Foundation


//  this one from: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
  guard a.count > 1 else { return a }

  let pivot = a[a.count/2]
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }

  return quicksort(less) + equal + quicksort(greater)
}




//this one from http://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#Swift
func mergeSort(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }
 
  let middleIndex = array.count / 2
 
  let leftPart = mergeSort(Array(array[0..<middleIndex]))
  let rightPart = mergeSort(Array(array[middleIndex..<array.count]))
 
  func merge(left: [Int], right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
 
    var merged = [Int]()
    merged.reserveCapacity(left.count + right.count)
 
    while leftIndex < left.count && rightIndex < right.count {
      if left[leftIndex] < right[rightIndex] {
        merged.append(left[leftIndex])
        leftIndex += 1
      } else if left[leftIndex] > right[rightIndex] {
        merged.append(right[rightIndex])
        rightIndex += 1
      } else {
        merged.append(left[leftIndex])
        leftIndex += 1
        merged.append(right[rightIndex])
        rightIndex += 1
      }
    }
 
    while leftIndex < left.count {
      merged.append(left[leftIndex])
      leftIndex += 1
    }
 
    while rightIndex < right.count {
      merged.append(right[rightIndex])
      rightIndex += 1
    }
 
    return merged
  }
 
  return merge(left: leftPart, right: rightPart)
}



let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
print(quicksort(list))
print(mergeSort(list))
