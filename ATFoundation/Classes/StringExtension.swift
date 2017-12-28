//
//  StringExtension.swift
//  Pods
//
//  Created by Spider on 17/9/13.
//
//
import Foundation

extension String
{
    //分割字符串 - 遇见多少个就分割多少个
    public func split(str: String) -> [String]
    {
        if str.isEmpty
        {
            var strArr = [String]()
            for char in self
            {
                strArr.append(String(char))
            }
            return strArr //空的话、无缝分割
        }
        return self.components(separatedBy: str)
    }
    
    //颠倒字符串
    public func reverse() -> String
    {
        let str = self.split(str: "").reversed()
        var newStr = ""
        for s in str
        {
            newStr += s
        }
        return newStr
    }
    
    //统计字符串个数
    public func howMany(str: String) -> Int
    {
        let strArr = str.split(str: "")
        var console = 0 //控制字符
        var times = 0
        for char in self
        {
            if String(char) == strArr[console]
            {
                console += 1
                if console >= strArr.count
                {
                    console = 0
                    times += 1
                }
            } else
            {
                console = 0
            }
        }
        return times
    }
    
    /**
     格式化字符串
     e.g. input   12345002
          output  123,450.02 or ¥123,450.02
     */
    public func formatMoney(_ money:String,hasSymbol:Bool,unit:String,toIntIfNeed:Bool) -> String
    {
        numberFormat.shared.currencySymbol = (!hasSymbol) ?"":"¥YYY"
        let moneyNum:NSNumber = NSNumber.init(value:(money as NSString).doubleValue * 0.01)
        var moneyStr = numberFormat.shared.string(from: moneyNum)! as String
        
        if toIntIfNeed
        {
            let strArray:[String] = moneyStr.components(separatedBy: ".")
            if (strArray.last! as NSString) .isEqual(to: "00")
            {
                moneyStr = strArray.first!
            }
        }
        if !unit.isEmpty
        {
            moneyStr += unit
        }
        return moneyStr
    }
    
    /**
     去掉左右的空格和换行符
     */
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /**
     如果swift再次升级改变函数,这样修改起来方便
     */
    public func has(other:String) -> Bool
    {
        return self.contains(other)
    }
    
    /**
     这个太经典了,获取指定位置和大小的字符串(这里仿OC中NSString的语法)
     - parameter start  : 起始位置
     - parameter length : 长度
     - returns : 字符串
     */
    public func subString(start:Int, length:Int = -1) -> String
    {
        var len = length
        if len == -1
        {
            len = self.count - start
        }
        let st = self.index(self.startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        let range = st ..< en
        return String(self[range])
    }
    
    /**
     替换字符串
     */
    public func replace(of:String,with:String) -> String
    {
        return self.replacingOccurrences(of: of, with: with)
    }
    
    /**
     单行字符串的size
     */
    public func sizeWithFont(font:UIFont) -> CGSize
    {
        let strs = [NSAttributedStringKey.font:font]
        let string:NSString = self as NSString
        return string.size(withAttributes: strs)
    }
    
    /**
     获取文字的宽高
     */
    public func textSize(text:String,font:UIFont,fontNumber:CGFloat) -> CGSize
    {
        let attributes = [NSAttributedStringKey.font:font];
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let size = CGSize(width:CGFloat(MAXFLOAT),height:fontNumber)
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect.size
    }
    
    /**
     将16进制字符串转为Int
     */
    public var hexInt:Int
    {
        return Int(self,radix:16) ?? 0
    }
    
    /**
     获取字符串长度
     */
    public var length:Int
    {
        return self.count
    }
}

public final class numberFormat: NumberFormatter
{
    static let shared = numberFormat()
    
    private override init()
    {
        super.init()
        self.numberStyle = .decimal
        self.currencyCode = ""
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}










































