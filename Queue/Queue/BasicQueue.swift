//
//  BasicQueue.swift
//  Queue
//
//  Created by Jiaxiang Li on 2020/10/17.
//  Copyright © 2020 Jiaxiang Li. All rights reserved.
//

import Cocoa

public struct BasicQueue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}
