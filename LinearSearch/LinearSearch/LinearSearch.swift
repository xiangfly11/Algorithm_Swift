//
//  LinearSearch.swift
//  LinearSearch
//
//  Created by Jiaxiang on 2020/11/4.
//

import Foundation

class LinearSearchTool: NSObject {
    class func LinearSearch<T : Equatable>(_ array:[T], _ object: T) -> Int? {
        for (index, objc) in array.enumerated() where object == objc {
            return index
        }
        return nil
    }
}
