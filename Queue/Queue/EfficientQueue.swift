//
//  EfficientQueue.swift
//  Queue
//
//  Created by Jiaxiang Li on 2020/10/18.
//  Copyright © 2020 Jiaxiang Li. All rights reserved.
//

import Cocoa

public struct EfficientQueue<T> {
    fileprivate var array = [T]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enque(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard  head < array.count else {
            return nil
        }
        
        let element = array[head]
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50, percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
     public var front: T? {
       if isEmpty {
         return nil
       } else {
         return array[head]
       }
     }
}
