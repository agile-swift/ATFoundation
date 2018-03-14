//
//  NSApp.swift
//  Pods
//
//  Created by Spider on 17/9/12.
//
//

import UIKit
import Foundation

/// message of app
final public class App : NSObject
{
    /// device name
    public class var iPhoneName : String
    {
        return UIDevice.current.name
    }
    
    /// app name
    public class var appName : String {
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        return name ?? "None"
    }
    
    /// app version
    public class var appVersion : String
    {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return version
    }
    
    public class var appDetailVersion : String
    {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        return version
    }
    
    public class var betteryLevel : Float
    {
        return UIDevice.current.batteryLevel
    }
    
    public class var localizedMode : String
    {
        return UIDevice.current.localizedModel
    }
    
    public class var systemVersion : String
    {
        return UIDevice.current.systemVersion
    }
    
    public class var systemName : String
    {
        return UIDevice.current.systemName
    }
    
    public class var uuid : String
    {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    public class var deviceName : String
    {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8,
            value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1","iPhone9,3":                   return "iPhone 7"
        case "iPhone9,2","iPhone9,4":                   return "iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":                 return "iPhone 8"
        case "iPhone10,2","iPhone10,5":                 return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":                 return "iPhone X"
            
            
        case "iPad1,1":                                 return "iPad"
        case "iPad1,2":                                 return "iPad 3G"
        case "iPad2,1":                                 return "iPad 2 (WiFi)"
        case "iPad2,2","iPad2,4":                       return "iPad 2"
        case "iPad2,3":                                 return "iPad 2 (CDMA)"
        case "iPad2,5":                                 return "iPad Mini (WiFi)"
        case "iPad2,6":                                 return "iPad Mini"
        case "iPad2,7":                                 return "iPad Mini (GSM+CDMA)"
        case "iPad3,1":                                 return "iPad 3 (WiFi)"
        case "iPad3,2":                                 return "iPad 3 (GSM+CDMA)"
        case "iPad3,3":                                 return "iPad 3"
        case "iPad3,4":                                 return "iPad 4 (WiFi)"
        case "iPad3,5":                                 return "iPad 4"
        case "iPad3,6":                                 return "iPad 4 (GSM+CDMA)"
        case "iPad4,1":                                 return "iPad Air (WiFi)"
        case "iPad4,2":                                 return "iPad Air (Cellular)"
        case "iPad4,4":                                 return "iPad Mini 2 (WiFi)"
        case "iPad4,5":                                 return "iPad Mini 2 (Cellular)"
        case "iPad4,6":                                 return "iPad Mini 2"
        case "iPad4,7","iPad4,8","iPad4,9":             return "iPad Mini 3"
        case "iPad5,1":                                 return "iPad Mini 4 (WiFi)"
        case "iPad5,2":                                 return "iPad Mini 4 (LTE)"
        case "iPad5,3","iPad5,4":                       return "iPad Air 2"
        case "iPad6,3","iPad6,4":                       return "iPad Pro 9.7"
        case "iPad6,7","iPad6,8":                       return "iPad Pro 12.9"
        
        case "i386","x86_64":                           return "Simulator"
        default:                                        return identifier
        }
    }
}

    

