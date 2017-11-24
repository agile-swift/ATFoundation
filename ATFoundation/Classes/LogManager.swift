//
//  LogManager.swift
//  Pods
//
//  Created by Spider on 17/9/18.
//
//



import Foundation


public enum LogLevel : String{
    case normal = "💚"
    case warning = "💛 "
    case error = "💔"
}

final class LogManager {
    
    static private var _logEnable:Bool = { ()->Bool in
        #if DEBUG
            return true
        #else
            return false
        #endif
    }()
    
    static public var logEnable : Bool {
        get { return _logEnable }
    }
    
    static public func enbaleLog(){
        _logEnable = true
    }
    static public func disableLog(){
        _logEnable = false
    }
}

public func logger(key:String = "",
                 level:LogLevel = .normal,
                 function : String = #function ,
                 file : String = #file,
                 line : Int = #line,
                 _ message: Any...){
    if LogManager.logEnable {
        let fileStr = file.components(separatedBy: CharacterSet.init(charactersIn: "/")).last ?? ""
        let str = convert(items: message)
        let keyStr = key.count != 0 ? "\(key)" : ""
        print(level.rawValue + keyStr + "\n\(fileStr).\(line)\n\(function)\n\(str)\n")
    }
}

public func logN(key:String = "",
                   function : String = #function ,
                   file : String = #file,
                   line : Int = #line,
                   _ message: Any...){
    if LogManager.logEnable {
        let fileStr = file.components(separatedBy: CharacterSet.init(charactersIn: "/")).last ?? ""
        let str = convert(items: message)
        let keyStr = key.count != 0 ? "\(key)" : ""
        print(LogLevel.normal.rawValue + keyStr + "\n\(fileStr).\(line)\n\(function)\n\(str)\n")
    }
}

public func logW(key:String = "",
               function : String = #function ,
               file : String = #file,
               line : Int = #line,
               _ message: Any...){
    if LogManager.logEnable {
        let fileStr = file.components(separatedBy: CharacterSet.init(charactersIn: "/")).last ?? ""
        let str = convert(items: message)
        let keyStr = key.count != 0 ? "\(key)" : ""
        print(LogLevel.warning.rawValue + keyStr + "\n\(fileStr).\(line)\n\(function)\n\(str)\n")
    }
}

public func logE(key:String = "",
               function : String = #function ,
               file : String = #file,
               line : Int = #line,
               _ message: Any...){
    if LogManager.logEnable {
        let fileStr = file.components(separatedBy: CharacterSet.init(charactersIn: "/")).last ?? ""
        let str = convert(items: message)
        let keyStr = key.count != 0 ? "\(key)" : ""
        print(LogLevel.error.rawValue + keyStr + "\n\(fileStr).\(line)\n\(function)\n\(str)\n")
    }
}


private func convert(items : [Any]?) -> String {
    let strings = (items ?? []).map { (item) -> String in
        return "\(item)"
    }
    let string = strings.joined(separator: " ")
    return string
}

