//
//  Stack.swift
//  Stack
//
//  Created by Jiaxiang Li on 2020/10/17.
//  Copyright © 2020 Jiaxiang Li. All rights reserved.
//

import Cocoa

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}
