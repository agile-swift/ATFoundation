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
    public func objectForSafeKey(_ key:Any?) -> Any?
    {
        guard let k = key else { return nil }
        return self.object(forKey: k)
    }
}

extension NSMutableDictionary
{
    public func setObjecForSafeKey(Object object:Any?,_ key:Any?)
    {
        guard let k = key,let v = object,let _k = k as? NSCopying else { return }
        self.setObject(v,forKey: _k)
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
