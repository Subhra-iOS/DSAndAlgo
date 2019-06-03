//
//  BinaryTree.swift
//  DSAndAlgo
//
//  Created by Subhra Roy on 03/06/19.
//  Copyright © 2019 Subhra Roy. All rights reserved.
//

//creating a binary tree is a perfect case to use a value type
// A binary tree is a finite set of nodes that is either empty, or consists of the value at the node and references to it’s left and right children.
import Foundation

/*Indirection
 Enumerations in Swift are value types. When Swift tries to allocate memory for value types, it needs to know exactly how much memory it needs to allocate.
 
 The enumeration you’ve defined is a recursive enum. That’s an enum that has an associated value that refers to itself. Recursive value types have a indeterminable size. So you’ve got a problem here. Swift expects to know exactly how big the enum is, but the recursive enum you’ve created doesn’t expose that information.
 
 Here’s where the indirect keyword comes in. indirect applies a layer of indirection between two value types. This introduces a thin layer of reference semantics to the value type.
 
 The enum now holds references to it’s associated values, rather than their value. References have a constant size, so you no longer have the previous problem.*/

/*each left child is smaller than its parent node, and each right child is greater than its parent node. This is the key feature of a binary search tree.*/

indirect enum BinaryTree<T> {
    case empty
    case node(BinaryTree, T, BinaryTree)
}

extension BinaryTree : CustomStringConvertible{
    var description: String {
        
        switch self {
            case .node(let left, let value, let right):
                 return  "value = \(value) , left = [" + left.description + "] , right = [" + right.description + "]"
            case .empty :
                    return  ""
        }
    
    }
    
    var nodeCount : Int{
        switch self {
            case .node(let leftNode, _ , let  rightNode):
                return leftNode.nodeCount + 1 +  rightNode.nodeCount
            case .empty :
                    return 0
        }
    }
    
}
