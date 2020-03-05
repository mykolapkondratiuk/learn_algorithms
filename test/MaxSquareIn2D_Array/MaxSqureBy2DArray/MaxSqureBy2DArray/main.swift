//
//  main.swift
//  MaxSqureBy2DArray
//
//  Created by Mykola Kondratyuk on 3/3/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

import Foundation

func biggestTable(matrix: [[Int]]) -> Int {
    print("matrix.count (number rows) = \(matrix.count)\n")
    
    for (index_row, row) in matrix.enumerated()
    {
        //print("index_row = \(index_row)")
        //print("row = \(row)\n")
        print("row.count = \(row.count)\n")
        
        for (index_column, element) in row.enumerated()
        {
            //print("index_column = \(index_column)")
            print("element = \(element)")
            
            print("matrix[\(index_row)][\(index_column)] = \(matrix[index_row][index_column])\n")
        }
    }
    return 0
}

let matrix = [[1,0,1,1],
              [0,0,1,1],
              [0,1,1,1]];
 _ = biggestTable(matrix: matrix)



