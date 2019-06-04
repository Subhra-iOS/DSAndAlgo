//
//  BinaryTreeClass.swift
//  DSAndAlgo
//
//  Created by Subhra Roy on 04/06/19.
//  Copyright © 2019 Subhra Roy. All rights reserved.
//

/*The time complexity is O(n), where n is the number of nodes in the tree.
 This should be obvious, since the idea of traversing a tree is to go through all the nodes!
*/

import Foundation

class TreeNode<T> {
    var leftNode : TreeNode?
    var rightNode : TreeNode?
    var data : T
    
     init(value : T, left : TreeNode?, right : TreeNode?){
        
        self.data = value
        self.leftNode = left
        self.rightNode = right
    }
    
}

class BinaryTreeClass < T : Comparable & CustomDebugStringConvertible>  {
    
    private var rootNode : TreeNode<T>?
    
    func insert(element : T){
        
        let newNode = TreeNode(value: element, left: nil, right: nil)
        if let root = self.rootNode{
            self.insert(rootNode: root, node: newNode)
        }else{
            self.rootNode = newNode
        }
        
    }
    
    private func insert(rootNode : TreeNode<T> , node : TreeNode<T>){
        
        if node.data < rootNode.data{
            if let leftNode = rootNode.leftNode{
                
                  self.insert(rootNode: leftNode, node: node)
                
            }else{
                rootNode.leftNode = node
            }
        }else{
            
            if let rightNode = rootNode.rightNode{
                self.insert(rootNode: rightNode, node: node)
            }else{
                rootNode.rightNode = node
            }
            
        }
        
    }
    
}


extension BinaryTreeClass{
    
    func traverseTree(){
        
        self.traverseInOrderWith(node: self.rootNode)
        print("\n")
        self.traversePreOrderWith(node: self.rootNode)
        print("\n")
        self.traversePostOrderWith(node: self.rootNode)
        
    }
    
    private func traverseInOrderWith(node : TreeNode<T>?){
        guard let _ = node else{ return }
        
        self.traverseInOrderWith(node: node?.leftNode)
        print("\(String(describing: node?.data))")
        self.traverseInOrderWith(node: node?.rightNode)
    }
    
    private func traversePreOrderWith(node : TreeNode<T>?){
        guard let _ = node else{ return }
        
        print("\(String(describing: node?.data))")
        self.traverseInOrderWith(node: node?.leftNode)
        self.traverseInOrderWith(node: node?.rightNode)
    }
    
    private func traversePostOrderWith(node : TreeNode<T>?){
        guard let _ = node else{ return }
        
        self.traverseInOrderWith(node: node?.leftNode)
        self.traverseInOrderWith(node: node?.rightNode)
        print("\(String(describing: node?.data))")
    }
    
}

extension BinaryTreeClass{
    
    func search(element : T) -> TreeNode<T>?{
        return  self.searchInTreeWith(data: element, node: self.rootNode)
    }
    
    private func searchInTreeWith(data : T, node : TreeNode<T>?) -> TreeNode<T>?{
        
        if data == node?.data{
            return  node
            
        }else if let currentNode = node , data < currentNode.data {
            
            return  self.searchInTreeWith(data: data, node: currentNode.leftNode)
            
        }else if let currentNode = node , data > currentNode.data {
            
             return  self.searchInTreeWith(data: data, node: currentNode.rightNode)
            
        }
        
        return  nil
    }
    
}
