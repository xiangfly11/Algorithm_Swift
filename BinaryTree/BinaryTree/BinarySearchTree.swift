//
//  BinarySearchTree.swift
//  BinaryTree
//
//  Created by Jiaxiang Li on 2021/3/22.
//

import Foundation

enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
      switch self {
      case let .node(left, _, right):
        return left.count + 1 + right.count
      case .empty:
        return 0
      }
    }
    
    /// 在二叉树中插入新的节点
    /// - Parameter newValue: 节点的值
    mutating func naviInsert(newValue: T) {
       self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    
    /// 在二叉树中搜索保护目标值的节点
    /// - Parameter targetValue: 目标值
    /// - Returns: 返回包含目标值的节点
    func searchTree(targetValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(leaf, value, right):
            if value == targetValue {
                return self
            }
            
            if targetValue < value {
                return leaf.searchTree(targetValue: targetValue)
            } else {
                return right.searchTree(targetValue: targetValue)
            }
        }
    }
    
    
    /// 中序遍历
    /// - Parameter process: block回调
    /// - Returns: 无
    func traverseInOrder(process: (T) -> ()) {
      switch self {
      // 1
      case .empty:
        return
      // 2
      case let .node(left, value, right):
        left.traverseInOrder(process: process)
        process(value)
        right.traverseInOrder(process: process)
      }
    }
    
    /// 前序遍历
    /// - Parameter process: block回调
    /// - Returns: 无
    func traversePreOrder(process: (T) -> ())  {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    /// 后序遍历
    /// - Parameter process: block回调
    /// - Returns: 无
    func traversePostOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePreOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    
    /// 将新的节点插入二叉树，形成一个新的二叉树
    /// - Parameter newValue: 二叉树结点的值
    /// - Returns: 返回新的二叉树
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
      switch self {
      // 1
      case .empty:
        return .node(.empty, newValue, .empty)
      // 2
      case let .node(left, value, right):
        if newValue < value {
          return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
        } else {
          return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
        }
      }
    }
}

extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}
