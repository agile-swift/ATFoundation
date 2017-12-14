//
//  FoundationMacros.swift
//  Pods
//
//  Created by 凯文马 on 2017/12/12.
//

import UIKit

// MARK: Lock

public typealias Lock = AnyObject

public func synchronized(_ lock:Lock,closure:()->()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

