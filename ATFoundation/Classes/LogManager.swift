//
//  LogManager.swift
//  Pods
//
//  Created by Spider on 17/9/18.
//
//



import Foundation


final class LogManager {
    
    var logEnable:Bool = true

    static let manager = LogManager()
    private init(){}
    
    func enbaleLog(){
        self.logEnable = true
    }
    func disableLog(){
        self.logEnable = false
    }
}


public func printmm(_ items:Any...) {
    #if DEBUG
//    print(items)
//        print(items)
        
        var string = ""
        
        for str in items {
            
            if str is String {
                string += str as! String
            } else {
                string += "\(str)"
            }
            
        }
        print(string)
    #endif

}

//public func printmm(message: Any...){
//    #if DEBUG
//        let file = #file
//        let method = #function
//        let line = #line
//        let fileString = (NSString.init(utf8String: file)!.lastPathComponent as NSString).utf8String
//        let str = (String.init(describing: message) as NSString).utf8String
//        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
//        fprintf(stderr,"===========\nFILE > %s:%d\nFUNC > %s\nTEXT > %s\n===========\n",fileString, #line,#function,str)
//    #else
//    
//    #endif
//}

