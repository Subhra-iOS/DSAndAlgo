//
//  Tree.swift
//  DSAndAlgo
//
//  Created by Subhra Roy on 03/06/19.
//  Copyright © 2019 Subhra Roy. All rights reserved.
//

import Foundation

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
