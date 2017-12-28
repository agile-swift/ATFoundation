//
//  DictionaryExtension.swift
//  Pods
//
//  Created by Spider on 17/9/12.
//
//

import Foundation

public extension Dictionary
{
    static public func += (a:inout Dictionary,b:Dictionary)
    {
        for (key,value) in b
        {
            a.updateValue(value, forKey: key)
        }
    }
}
