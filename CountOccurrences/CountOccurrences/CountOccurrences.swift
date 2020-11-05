//
//  CountOccurrences.swift
//  CountOccurrences
//
//  Created by Jiaxiang on 2020/11/5.
//

import Foundation

class CountOccurrences: NSObject {
    func CountOccurrences<T: Comparable>(key: T, _ array:[T]) -> Int {
        var leftBoundary: Int {
            var low = 0
            var high = array.count
            
            while low < high {
                let midIndex = low + (high - low) / 2
                if array[midIndex] < key {
                    low = midIndex + 1
                } else {
                    high = midIndex
                }
            }
            
            return low
        }
        
        var rightBonudary: Int {
            var low = 0
            var high = array.count
            
            while low < high {
                let midIndex = low + (high - low) / 2
                if array[midIndex] > key {
                    high = midIndex
                } else {
                    low = midIndex + 1
                }
            }
            
            return low
        }
        
        return rightBonudary - leftBoundary
    }
}
