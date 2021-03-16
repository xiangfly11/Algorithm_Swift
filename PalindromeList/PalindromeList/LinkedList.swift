//
//  LinkedList.swift
//  PalindromeList
//
//  Created by Jiaxiang Li on 2021/3/16.
//

import Foundation

typealias Node = ListNode

class ListNode<T: Equatable> {
    var value: T?
    var next: Node<T>?
}

class LinkedList<T: Equatable> {
    var head: Node<T>?
    var count: Int?
    
    func appendNode(node: Node<T>) -> Node<T>? {
        if head == nil {
            head = node
            head?.next = nil
        } else {
            var cur = head
            while  cur?.next != nil {
                cur = cur?.next
            }
            cur?.next = node
        }
        
        return head
    }
    
    
    func traverse(head: Node<T>?) {
        guard let h = head else {
            return
        }
    
        //前序遍历
        print(h.value)
        
        traverse(head:h.next)
        
        //后序遍历
//        print(h.value)
    }
    
    var leftNode: Node<T>?
    func postTraverseListCompare(head: Node<T>?) -> Bool {
        guard let h = head else {
            return true
        }
        var res = postTraverseListCompare(head: h.next)
        res = res && h.value == leftNode?.value
        leftNode = leftNode?.next
        return res
    }
    
    func isPalindromList(head: Node<T>?) -> Bool {
        leftNode = head
        return postTraverseListCompare(head: head)
    }
}
