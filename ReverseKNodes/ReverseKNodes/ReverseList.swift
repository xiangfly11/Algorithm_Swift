//
//  ReverseList.swift
//  ReverseKNodes
//
//  Created by Jiaxiang Li on 2021/3/15.
//

import Foundation


typealias Node = ListNode

class ListNode<T> {
    var value: T?
    var next: Node<T>?
}

class LinkedList<T> {
    var head: Node<T>?
    var count: Int?
    
    func appendNode(node: Node<T>) {
        if head == nil {
            head = node
        } else {
            var cur = head
            while cur?.next != nil {
                cur = cur?.next
            }
            
            cur?.next = node
        }
    }
    
    
    /// 递归反转整个单向链表
    /// - Parameter head: 链表头节点
    /// - Returns: 链表头节点
    func reverseLinkedListRecusively(head: Node<T>?) -> Node<T>? {
        if head?.next == nil {
            return head
        }
        
        let last = reverseLinkedListRecusively(head: head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
    
    
    /// 迭代反转整个单向链表
    /// - Parameter head: 链表头节点
    /// - Returns: 链表头节点
    func reverseLinkedListIteratively(head: Node<T>?) -> Node<T>? {
        if head?.next == nil {
            return head
        }
        
        var pre: Node<T>?
        var cur = head
        var next = head
        
        while cur != nil {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
}

