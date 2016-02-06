//
//  Alarm.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-01.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

public enum Weekdays{
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturaday
}

public class Alarm: NSObject {
    public var hour: Int
    public var minute: Int
    public var amIsTrue: Bool
    public var weekday: [Weekdays]!
    public var alarmIsOn: Bool
    
    init(hour:Int, minute:Int, am:Bool){
        self.hour = hour
        self.minute = minute
        self.amIsTrue = am
        self.alarmIsOn = true
    }

}
