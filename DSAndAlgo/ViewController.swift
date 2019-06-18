//
//  ViewController.swift
//  DSAndAlgo
//
//  Created by Subhra Roy on 03/06/19.
//  Copyright © 2019 Subhra Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let rootNode : Node = self.createRootNode()
        let treeDescription : String = rootNode.description
        print("\(treeDescription)")
        
        let foundNode : Node = rootNode.search(data: "Milk")!
        print("\(foundNode)")
        print("\(String(describing: foundNode.parentNode?.description))")
        
        let binaryTree : BinarySearchTree = self.creatBinarySearchTree()
        print("\(binaryTree.description)")
        print("\(binaryTree.nodeCount)")
        
        var emptyBinaryTree : BinarySearchTree<Int> = .empty
        print("\(emptyBinaryTree.description)")
        
         emptyBinaryTree.insert(newValue: 5)
         emptyBinaryTree.insert(newValue: 7)
         emptyBinaryTree.insert(newValue: 9)
    
        
        print("\(emptyBinaryTree.description)")
        
        var tree: BinarySearchTree<Int> = .empty
        tree.insert(newValue: 7)
        tree.insert(newValue: 10)
        tree.insert(newValue: 2)
        tree.insert(newValue: 1)
        tree.insert(newValue: 5)
        tree.insert(newValue: 9)
        
        tree.traverseInOrder { print($0.description) }
        // tree.traversePreOrder { print($0.description) }
        // tree.traversePostOrder { print($0.description) }

        let foundSearchNode = tree.searchInBinaryTree(searchValue: 9)
        print("\(String(describing: foundSearchNode))")
        
        
        let treeClass = BinaryTreeClass<String>()
        
        treeClass.insert(element: "F")
        treeClass.insert(element: "G")
        treeClass.insert(element: "H")
        treeClass.insert(element: "D")
        treeClass.insert(element: "E")
        treeClass.insert(element: "I")
        treeClass.insert(element: "J")
        treeClass.insert(element: "A")
        treeClass.insert(element: "B")
        treeClass.insert(element: "C")
        
        treeClass.traverseTree()
        
       let eNode =  treeClass.search(element: "E")
       let nNode =  treeClass.search(element: "N")
        
        print("\(String(describing: eNode?.data))")
        print("\(String(describing: nNode?.data))")
        
        printBinaryDigitWith(string: "1??0?101", index: 0)
    }
    
    private func creatBinarySearchTree() -> BinarySearchTree<String>{
        
        /*An interesting exercise to check out is to model a series of calculations using a binary tree. Take this for an example for modelling (5 * (a - 10)) + (-4 * (3 / b)) */
        
        // leaf nodes
        let node5 = BinarySearchTree.node(.empty, "5", .empty)
        let nodeA = BinarySearchTree.node(.empty, "a", .empty)
        let node10 = BinarySearchTree.node(.empty, "10", .empty)
        let node4 = BinarySearchTree.node(.empty, "4", .empty)
        let node3 = BinarySearchTree.node(.empty, "3", .empty)
        let nodeB = BinarySearchTree.node(.empty, "b", .empty)
        
        // intermediate nodes on the left
        let Aminus10 = BinarySearchTree.node(nodeA, "-", node10)
        let timesLeft = BinarySearchTree.node(node5, "*", Aminus10)
        
        // intermediate nodes on the right
        let minus4 = BinarySearchTree.node(.empty, "-", node4)
        let divide3andB = BinarySearchTree.node(node3, "/", nodeB)
        let timesRight = BinarySearchTree.node(minus4, "*", divide3andB)
        
        // root node
        let tree = BinarySearchTree.node(timesLeft, "+", timesRight)

        return tree
    }
    
    
    private func createRootNode() -> Node<String>{
        
        let rootNode : Node<String> = Node(data: "Beverages")
        
        let hotBeverage = Node(data: "Hot")
        let coldBeverage = Node(data: "Cold")
        
        let tea = Node(data: "Tea")
        let coffee = Node(data: "Coffee")
        let cocoa = Node(data: "Cocoa")
        
        let blackTea = Node(data: "Black")
        let greenTea = Node(data: "Green")
        let chaiTea = Node(data: "Chai")
        
        let soda = Node(data: "Soda")
        let milk = Node(data: "Milk")
        
        let gingerAle = Node(data: "Ginger ale")
        let bitterLemon = Node(data: "Bitter lemon")
        
        rootNode.addChild(child: hotBeverage)
        rootNode.addChild(child: coldBeverage)
        
        hotBeverage.addChild(child: tea)
        hotBeverage.addChild(child: coffee)
        hotBeverage.addChild(child: cocoa)
        
        coldBeverage.addChild(child: soda)
        coldBeverage.addChild(child: milk)
        
        tea.addChild(child: blackTea)
        tea.addChild(child: greenTea)
        tea.addChild(child: chaiTea)
        
        soda.addChild(child: gingerAle)
        soda.addChild(child: bitterLemon)

        
        return rootNode
    }
    
}

extension ViewController{
    /*Given a string containing of ‘0’, ‘1’ and ‘?’ wildcard characters, generate all binary strings that can be formed by replacing each wildcard character by ‘0’ or ‘1’.*/
    
    func printBinaryDigitWith(string : String, index : Int) -> Void{
        
        let mutableStr : String = string
        
        if index == mutableStr.count  {
            print("\(mutableStr)")
            return
        }else{
            guard let index0 : String.Index = string.firstIndex(of: "?") else {
                
                return
            }
            // let position : String.IndexDistance = mutableStr.distance(from: mutableStr.startIndex, to: idx)
            let newStr0 : String = mutableStr.replaceCharacterAt(index: index0.encodedOffset, with: String.Element("0"))
            print("\(newStr0)")
            guard let index1 : String.Index = newStr0.firstIndex(of: "?") else {
                
                return
            }
            let newStr1 : String = newStr0.replaceCharacterAt(index: index1.encodedOffset, with: String.Element("1"))
            print("\(newStr1)")
            printBinaryDigitWith(string: newStr1, index: (index1.encodedOffset + 1))
        }
        
    }
}

extension String{
    func replaceCharacterAt(index : Int, with character : String.Element) -> String{
        
        var characters : [String.Element] =  Array(self)
        characters[index] = character
        let newString : String = String(characters)
        return newString
    }
}
