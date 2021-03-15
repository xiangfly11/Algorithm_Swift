//
//  main.swift
//  ReverseKNodes
//
//  Created by Jiaxiang Li on 2021/3/15.
//

import Foundation

let linkedList1 = LinkedList<Int>.init()
let linkedList2 = LinkedList<Int>.init()
for i in 0 ... 6 {
    let node = ListNode<Int>.init()
    node.value = i
    linkedList1.appendNode(node: node)
}

for i in 0 ... 6 {
    let node = ListNode<Int>.init()
    node.value = i
    linkedList2.appendNode(node: node)
}

let head1 = linkedList1.reverseLinkedListRecusively(head: linkedList1.head)
let head2 = linkedList2.reverseLinkedListIteratively(head: linkedList2.head)

var cur1 = head1
while cur1?.next != nil {
    print(cur1?.value)
    cur1 = cur1?.next
}

var cur2 = head2
while cur2?.next != nil {
    print(cur2?.value)
    cur2 = cur2?.next
}

print("finished")

