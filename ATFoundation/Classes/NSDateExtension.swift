//
//  NSDateExtension.swift
//  Pods
//
//  Created by Spider on 17/9/11.
//
//


import Foundation

let WEEK:Double = 604800
let DAY:Double = 86400
let HOUR:Double = 3600
let unitSet:Set<Calendar.Component> = [Calendar.Component.year,
                                       Calendar.Component.month,
                                       Calendar.Component.day,
                                       Calendar.Component.hour,
                                       Calendar.Component.second,
                                       Calendar.Component.minute,
                                       Calendar.Component.weekday,
                                       Calendar.Component.weekdayOrdinal]
public enum DateUnit: Int{
    case Seconds = 1
    case Minute = 60
    case Hour = 3600
    case Day = 86400
    case Week = 604800
}

public protocol DateType
{
    var date : Date { get }
}
extension Date : DateType
{
    public var date: Date
    {
        return self
    }
}
extension NSDate : DateType
{
    public var date: Date
    {
        return self as Date
    }
}
extension TimeInterval : DateType
{
    public var date : Date
    {
        return Date.init(timeIntervalSince1970: self)
    }
}

private let formatter:DateFormatter = DateFormatter()
public func string(by:String,date:DateType)->String
{
    if by != formatter.dateFormat {
        formatter.dateFormat = by
    }
    return formatter.string(from: date.date)
}
extension NSDate{
    
    public class var now : NSDate {
        return NSDate()
    }
    
    public func before(_ value:UInt = 1,unit:DateUnit = .Day) -> NSDate
    {
        return self.addingTimeInterval(Double(-unit.rawValue * Int(value)))
    }
    
    public func after(_ value:UInt = 1,unit:DateUnit = .Day) -> NSDate
    {
        return self.addingTimeInterval(Double(unit.rawValue * Int(value)))
    }
    
    public func tomorrow(_ value:UInt = 1,unit:DateUnit = .Day) -> NSDate
    {
        return after(1, unit: .Day)
    }
    
    public func yesterday(_ value:UInt = 1,unit:DateUnit = .Day) -> NSDate
    {
        return before(1, unit: .Day)
    }
    
    public func afterHours(_ value:UInt = 1,unit:DateUnit = .Hour) -> NSDate
    {
        return after(value, unit: unit)
    }
    
    public func beforeHours(_ value:UInt = 1,unit:DateUnit = .Hour) -> NSDate
    {
        return before(value, unit: unit)
    }
    
    public func isEqualToDateIgnorTime(_ date:NSDate)->Bool
    {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        let component2:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:date as Date) as NSDateComponents
        return (component1.year == component2.year) && (component1.month == component2.month) && (component1.day == component2.day)
    }
    
    public func isToday()->Bool
    {
        return isEqualToDateIgnorTime(NSDate())
    }
    
    public func isTomorrow()->Bool
    {
        return isEqualToDateIgnorTime(tomorrow())
    }
    
    public func isYesterday()->Bool
    {
        return isEqualToDateIgnorTime(yesterday())
    }
    
    public func isSameWeekAsDate(_ date:NSDate)->Bool
    {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        let component2:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:date as Date) as NSDateComponents
        
        if component1.weekOfYear != component2.weekOfYear {
            return false
        }
        return self.timeIntervalSince(date as Date)<WEEK
    }
    
    public func isThisWeek() -> Bool
    {
        return isSameWeekAsDate(NSDate.now)
    }
    
    public func isSameYearAsDate(_ date:NSDate) -> Bool {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        let component2:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:date as Date) as NSDateComponents
        return component1.year == component2.year
    }
    
    public func isThisYear() -> Bool {
        return isSameWeekAsDate(NSDate.now)
    }
    
    public func hour() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.hour
    }
    
    public func minute() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.minute
    }
    
    public func seconds() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.second
    }
    
    public func day() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.day
    }
    
    public func month() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.month
    }
    
    public func week() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.weekOfYear
    }
    
    public func weekDay() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.weekday
    }
    
    public func nthWeekday() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.weekdayOrdinal
    }
    
    public func year() -> Int {
        let component1:NSDateComponents = NSCalendar.current.dateComponents(unitSet, from:self as Date) as NSDateComponents
        return component1.year
    }
}
