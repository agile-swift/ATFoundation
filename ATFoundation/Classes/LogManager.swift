//
//  LogManager.swift
//  Pods
//
//  Created by Spider on 17/9/18.
//
//



import Foundation

/// log level of customer log
public enum LogLevel : String{
    case normal = "💚"
    case warning = "💛 "
    case error = "💔"
    case none = ""
}

/// obtain log message delegate, for class only
public protocol LogManagerDelegate : class {
    func logManager(_ logManager : LogManager, didReceiveLog log : String)
}

/// the manager of log
final public class LogManager {
    
    private init() { }
    
    public static let shared = LogManager()

    weak public var delegate : LogManagerDelegate?
    
    public var logEnable : Bool {
        get { return _logEnable }
    }

    /// enable log , default is true in DEBUG, otherwise false
    public func enableLog(){
        _logEnable = true
    }
    public func disableLog(){
        _logEnable = false
    }
    
    private var _logEnable:Bool = { ()->Bool in
        #if DEBUG
            return true
        #else
            return false
        #endif
    }()
}

/// log method instead of the system print, just like log in Android.
/// i think you need to copy this method to your project, and blank in your own key
/// output : 'kevin 💚    ViewController.swift.15    ViewController    ["call Block   1"]'
///
/// - Parameters:
///   - key: keyword to filter
///   - level: log level,filter too
///   - function: call this methed in which function
///   - file: log in file
///   - line: log of line
///   - message: log message
public func logger(key:String = "",
                 level:LogLevel = .normal,
                 function : String = #function ,
                 file : String = #file,
                 line : Int = #line,
                 _ message: Any...){
    if LogManager.shared.logEnable {
        let fileStr = file.components(separatedBy: CharacterSet.init(charactersIn: "/")).last ?? ""
        let str = convert(items: message)
        let keyStr = key.count != 0 ? "\(key)" : ""
        LogManager.shared.delegate?.logManager(LogManager.shared, didReceiveLog: str)
        print(level.rawValue + keyStr + "\t\(fileStr).\(line)\t\(function)\t\(str)\n")
    }
}

public func logN(key:String = "",
                   function : String = #function ,
                   file : String = #file,
                   line : Int = #line,
                   _ message: Any...){
    logger(key: key, level: .normal, function: function, file: file, line: line, message)
}

public func logW(key:String = "",
               function : String = #function ,
               file : String = #file,
               line : Int = #line,
               _ message: Any...){
    logger(key: key, level: .warning, function: function, file: file, line: line, message)
}

public func logE(key:String = "",
               function : String = #function ,
               file : String = #file,
               line : Int = #line,
               _ message: Any...){
    logger(key: key, level: .error, function: function, file: file, line: line, message)
}


private func convert(items : [Any]?) -> String {
    let strings = (items ?? []).map { (item) -> String in
        return "\(item)"
    }
    let string = strings.joined(separator: " ")
    return string
}

extension LogManagerDelegate {
    func logManager(_ logManager : LogManager, didReceiveLog log : String) {
        
    }
}

