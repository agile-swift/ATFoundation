//
//  NSDictionaryExtension.swift
//  Pods
//
//  Created by Spider on 17/9/12.
//
//

import Foundation

extension NSDictionary
{
    public func objectForSafeKey(_ key:Any) -> Any?
    {
        if key != nil
        {
            return self .object(forKey: key)
        }
        return nil
    }
}

extension NSMutableDictionary
{
    public func setObjecForSafeKey(Object object:Any,_ key:Any)
    {
        if object != nil && key != nil
        {
            self .setObject(object, forKey: key as! NSCopying)
        }
    }
}

extension Dictionary
{
    static public func += (a:inout Dictionary,b:Dictionary)
    {
        for (key,value) in b
        {
            a.updateValue(value, forKey: key)
        }
    }
}
