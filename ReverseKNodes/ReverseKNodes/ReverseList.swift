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
    var count: Int = 0
    
    func appendNode(node: Node<T>) {
        if head == nil {
            head = node
            count += 1
        } else {
            var cur = head
            while cur?.next != nil {
                cur = cur?.next
            }
            
            cur?.next = node
            count += 1
        }
    }
    
    
    /// 前序遍历打印链表中的节点
    /// - Parameter head: 头节点
    func printLinkedList(head: Node<T>) {
        print(head.value)
        guard let next = head.next else {
            return
        }
        printLinkedList(head: next)
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
    
    
    var successor: Node<T>?
    
    /// 递归链表头到长度为n的部分链表节点
    /// - Parameters:
    ///   - head: 链表头
    ///   - length: 长度为n的节点部分
    /// - Returns: 新的链表头
    func reverseLinkedListTo(head: Node<T>?, length: Int) -> Node<T>? {
        if length > count || length <= 0 {
            return head
        }
        if length == 1 {
            successor = head?.next
            return head
        }
        
        let last = reverseLinkedListTo(head: head?.next, length: length - 1)
        head?.next?.next = head
        head?.next = successor
        return last
    }
    
    
    /// 反转链表0 < start <= end < count 区间的链表节点
    /// - Parameters:
    ///   - head: 链表头节点
    ///   - start: 起点区间位置
    ///   - end: 结束区间位置
    ///   - Returns: 新的链表头节点
    func reverseLinkedListBetween(head: Node<T>?, start: Int, end: Int) -> Node<T>? {
        if start < 0 || start > end || end < 0 || start > count || end > count {
            return head
        }
        
        if start == 1 {
            return reverseLinkedListTo(head: head, length: end)
        }
        
        head?.next = reverseLinkedListBetween(head: head?.next, start: start - 1, end: end - 1)
        
        return head
    }
}

