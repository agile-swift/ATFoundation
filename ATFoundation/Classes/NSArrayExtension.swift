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
    public func objectAtIndex(_ index:Int?) -> Any? {
        
        if index != nil && index! >= 0 && index! < self.count
        {
            return self.object(at: index!)
        }
        return nil
    }
    
    public var isEmpty : Bool {
        return self.count == 0
    }
}

extension NSMutableArray {
    public func addObject(_ object:Any?) {
        if object != nil {
            self.add(object!)
        }
    }
    
    public func insertObject(_ object:Any?,at index:Int?) {
        if object != nil && index != nil && index! >= 0 && index! < self.count {
            self.insert(object!, at: index!)
        }
        
    }
    
    public func addObjectsFromArray(array:NSArray?){
        
        if array == nil || array!.isEmpty { return }
        self.addObjects(from: array as! [Any])
    }
    
}
