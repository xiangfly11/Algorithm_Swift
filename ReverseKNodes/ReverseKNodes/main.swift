//
//  main.swift
//  ReverseKNodes
//
//  Created by Jiaxiang Li on 2021/3/15.
//

import Foundation

let linkedList1 = LinkedList<Int>.init()
let linkedList2 = LinkedList<Int>.init()
let linkedList3 = LinkedList<Int>.init()
let linkedList4 = LinkedList<Int>.init()

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

for i in 0 ... 6 {
    let node = ListNode<Int>.init()
    node.value = i
    linkedList3.appendNode(node: node)
}

for i in 0 ... 6 {
    let node = ListNode<Int>.init()
    node.value = i
    linkedList4.appendNode(node: node)
}


if let head1 = linkedList1.reverseLinkedListRecusively(head: linkedList1.head) {
    linkedList1.printLinkedList(head: head1)
    print("***** Head1 finished *****")
}
if let head2 = linkedList2.reverseLinkedListIteratively(head: linkedList2.head) {
    linkedList2.printLinkedList(head: head2)
    print("***** Head2 finished *****")
}
if let head3 = linkedList3.reverseLinkedListTo(head: linkedList3.head, length: linkedList3.count - 2) {
    linkedList3.printLinkedList(head: head3)
    print("***** Head3 finished *****")
}
if let head4 = linkedList4.reverseLinkedListBetween(head: linkedList4.head, start: 2, end: 5) {
    linkedList4.printLinkedList(head: head4)
    print("***** Head4 finished *****")
}


print("finished")

