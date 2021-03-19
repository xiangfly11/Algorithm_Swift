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
    
    
    func traversePrint(head: Node<T>?) {
        guard let h = head else {
            return
        }
    
        //前序遍历
        print(h.value)
        
        traversePrint(head:h.next)
        
        //后序遍历
//        print(h.value)
    }
    
    // MARK: 使用递归判断链表是否是回文链表
    // 空间复杂度：O(n) 时间复杂度：O(n)
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
    
    func isPalindromListRecurisivly(head: Node<T>?) -> Bool {
        leftNode = head
        return postTraverseListCompare(head: head)
    }
    
    // MARK: 使用迭代判断链表是否是回文
    // 空间复杂度：O(1) 时间复杂度:O(n)
    func reverse(head:Node<T>?) -> Node<T>? {
        var pre: Node<T>?
        var curr: Node<T>? = head
        var next: Node<T>? = head
        
        while curr != nil {
            next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        
        return pre
    }
    
    func isPalindromListIteratively(head: Node<T>?) -> Bool {
        var slow: Node<T>? = head
        var fast: Node<T>? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        //如果fast没有指向nil,那么链表个数为奇数，慢指针向前移动以为
        if fast != nil {
            slow = slow?.next
        }
        
        //反转慢指针所指向节点之后的链表
        var right = reverse(head: slow)
        var left = head
        
        while right != nil {
            if left?.value != right?.value {
                return false
            }
            
            left = left?.next
            right = right?.next
        }
        return true
    }
}
