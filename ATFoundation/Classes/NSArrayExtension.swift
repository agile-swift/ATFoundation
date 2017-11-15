//
//  NSArrayExtension.swift
//  Pods
//
//  Created by Spider on 17/9/11.
//
//

import Foundation

extension NSArray
{
    public func objectAtIndex(Index index:Int)->Any?{
        
        if index>=0 && self.count<index
        {
            return self.object(at: index)
        }
        return nil
    }
    
    public func isEmpty()->Bool{
        return self.count==0
    }
}
extension NSMutableArray
{
    public func addObject(Object object:Any?){
        
        if object != nil
        {
            self.add(object!)
        }
    }
    
    public func insertObject(Object object:Any?,Index index:Int) {
        
        if object != nil && index>=0 && index<self.count
        {
            self.insert(object!, at: index)
        }
        
    }
    
    public func addObjectsFromArray(array:NSArray){
        
        if !array.isEmpty()
        {
            self.addObjects(from: array as! [Any])
        }
    }
    
}
























