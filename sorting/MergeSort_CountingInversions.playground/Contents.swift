import Cocoa

var numberShifts = 0

func countInversions(arr: [Int]) -> Int {
    numberShifts = 0;
    let _ = mergeSort(arr)
    print("number shifts: \(numberShifts)\n")
    
    return numberShifts
}



public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
  guard array.count > 1 else {
    return array
  }
  let middle = array.count / 2
  let left = mergeSort(Array(array[..<middle]))
  let right = mergeSort(Array(array[middle...]))
  return merge(left, right)
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
   
  var leftIndex = 0
  var rightIndex = 0
  var result: [Element] = []
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]
    if leftElement < rightElement {
      result.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      result.append(rightElement)
      rightIndex += 1
        //print("left: \(leftElement)  right: \(rightElement)\n")
        numberShifts += 1;
    } else {
      result.append(leftElement)
      leftIndex += 1
      result.append(rightElement)
      rightIndex += 1
    }
  }
  if leftIndex < left.count {
    result.append(contentsOf: left[leftIndex...])
  }
  if rightIndex < right.count {
    result.append(contentsOf: right[rightIndex...])
  }
  return result
}


let array = [7, 2, 6, 3, 9]
let inversions = countInversions(arr:array)

let array_2 = [1,1,1,2,2]
let inversions_2 = countInversions(arr:array_2)

let array_3 = [2, 1, 3, 1, 2]
let inversions_3 = countInversions(arr:array_3)
