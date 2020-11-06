//
//  MinimumAndMaximum.swift
//  MinimumAndMaximum
//
//  Created by Jiaxiang on 2020/11/6.
//

import Foundation

class MinimumAndMaximum: NSObject {
    func minimum<T: Comparable>(_ array:[T]) -> T? {
        guard var minimum = array.first else {
            return nil
        }
        
        for element in array {
            minimum = element < minimum ? element : minimum
        }
        
        return minimum
    }
    
    func maxmum<T: Comparable>(_ array:[T]) -> T? {
        guard var maximum = array.first else {
            return nil
        }
        
        for element in array {
            maximum = element > maximum ? element : maximum
        }
        
        return maximum
    }
    
    func minimumMaximum<T: Comparable>(_ array:[T]) -> (minimum: T, maximum: T)? {
        guard var minimum = array.first else {
            return nil
        }
        
        var maximum = minimum
        let start = array.count % 2
        for i in stride(from: start, to: array.count, by: 2) {
            let pair = (array[i], array[i+1])
            
            if pair.0 > pair.1 {
                maximum = pair.0 > maximum ? pair.0 : maximum
                minimum = pair.1 < minimum ? pair.1 : minimum
            } else {
                maximum = pair.1 > maximum ? pair.1 : maximum
                minimum = pair.0 < minimum ? pair.0 : minimum
            }
        }
        return (minimum, maximum)
    }
}
