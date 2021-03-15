//
//  BinarySearch.swift
//  BinarySearch
//
//  Created by Jiaxiang on 2020/11/4.
//

import Foundation

class BinarySearch: NSObject {
    class func BinarySearchRecursive<T: Comparable>(_ array:[T], _ objc: T, range: Range<Int>) -> Int? {
        if range.lowerBound > range.upperBound {
            return nil
        } else {
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            
            if array[midIndex] > objc {
                return BinarySearchRecursive(array, objc, range: range.lowerBound ..< midIndex)
            } else if array[midIndex] < objc {
                return BinarySearchRecursive(array, objc, range: midIndex + 1 ..< range.upperBound)
            } else {
                return midIndex
            }
        }
    }
    
    class func BinarySearchIterative<T: Comparable>(_ array:[T], _ objc: T) -> Int? {
        var lowerBound = 0
        var upperBound = array.count
        
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            if array[midIndex] == objc {
                return midIndex
            } else if array[midIndex] < objc {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        return nil
    }
}
