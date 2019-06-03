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
        
        let binaryTree : BinaryTree = self.creatBinaryTree()
        print("\(binaryTree.description)")
        print("\(binaryTree.nodeCount)")
        
        var emptyBinaryTree : BinaryTree<Int> = .empty
        print("\(emptyBinaryTree.description)")
        
         emptyBinaryTree.insert(newValue: 5)
         emptyBinaryTree.insert(newValue: 7)
         emptyBinaryTree.insert(newValue: 9)
    
        
        print("\(emptyBinaryTree.description)")
        
    }
    
    private func creatBinaryTree() -> BinaryTree<String>{
        
        /*An interesting exercise to check out is to model a series of calculations using a binary tree. Take this for an example for modelling (5 * (a - 10)) + (-4 * (3 / b)) */
        
        // leaf nodes
        let node5 = BinaryTree.node(.empty, "5", .empty)
        let nodeA = BinaryTree.node(.empty, "a", .empty)
        let node10 = BinaryTree.node(.empty, "10", .empty)
        let node4 = BinaryTree.node(.empty, "4", .empty)
        let node3 = BinaryTree.node(.empty, "3", .empty)
        let nodeB = BinaryTree.node(.empty, "b", .empty)
        
        // intermediate nodes on the left
        let Aminus10 = BinaryTree.node(nodeA, "-", node10)
        let timesLeft = BinaryTree.node(node5, "*", Aminus10)
        
        // intermediate nodes on the right
        let minus4 = BinaryTree.node(.empty, "-", node4)
        let divide3andB = BinaryTree.node(node3, "/", nodeB)
        let timesRight = BinaryTree.node(minus4, "*", divide3andB)
        
        // root node
        let tree = BinaryTree.node(timesLeft, "+", timesRight)

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

class Node<T>{
    
    var value : T?
    private var children : [Node] = [Node]()
    internal  private(set) weak var parentNode : Node?
    convenience init(data : T){
        self.init()
        self.value = data
    }
    private init(){
        
    }
    
    func addChild(child : Node){
        self.children.append(child)
        child.parentNode = self
    }
    
    func getChildren() -> [Node]?{
        
        if self.children.count > 0{
            return self.children
        }else{
            return nil
        }
        
    }
    
}

extension Node : CustomStringConvertible{
    
    var description: String {
        
         var des : String = self.value as! String
        if !self.children.isEmpty{
            des += " { " + self.children.map{ $0.description }.joined(separator: ", ") + " } "
        }
        
        return des
    }
    
}

extension Node where T : Equatable{
    
    func search(data : T) -> Node?{
        
        if self.value == data{
            return self
        }else{
            
            for (_ , child) in self.children.enumerated(){
                
                if let nodeFound : Node = child.search(data: data){
                    return nodeFound
                }
            }
        }
        return nil
    }
    
}
