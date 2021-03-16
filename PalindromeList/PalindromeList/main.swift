//
//  main.swift
//  PalindromeList
//
//  Created by Jiaxiang Li on 2021/3/16.
//

import Foundation

let linkedList1 = LinkedList<Int>.init()
for i in 0 ... 5 {
    let node = ListNode<Int>.init()
    node.value = i
    let _ = linkedList1.appendNode(node: node)
}

var i = 5
while i >= 0 {
    let node = ListNode<Int>.init()
    node.value = i
    let _ = linkedList1.appendNode(node: node)
    i = i - 1
}

linkedList1.traverse(head: linkedList1.head)
let isPalindromList = linkedList1.isPalindromList(head: linkedList1.head)

print("finished")
