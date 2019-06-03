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

