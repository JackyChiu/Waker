//
//  Alarm.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-01.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

let dayInSeconds:Double = Double(60*60*24)

enum Weekdays:Int{
    case Sun
    case Mon
    case Tue
    case Wed
    case Thu
    case Fri
    case Sat
}

class Alarm: NSObject {
    var alarmDate: Date
    let audioPlayer: AudioPlayer
    
    let alarmRepeats: Bool
    let alarmSound: String
    var repeatOnTheseWeekdays: [Weekdays]
    var alarmIsOn: Bool = true
    
    init(alarmDate:Date, repeatOnTheseWeekdays:[Weekdays], alarmSound:String) {
        self.alarmDate = alarmDate
        self.repeatOnTheseWeekdays = repeatOnTheseWeekdays
        self.alarmSound = alarmSound
        self.audioPlayer = AudioPlayer(alarmSound: alarmSound)
        
        if repeatOnTheseWeekdays.count == 0 {
            self.alarmRepeats = false
        }
        else{
            self.alarmRepeats = true
        }
    }
}

/*
public class Alarm: NSObject {
    public var date: NSDate
    public var hour: Int
    public var minute: Int
    public var amIsTrue: Bool
    public var repeatOnTheseWeekdays: [Weekdays]!
    public var alarmIsOn: Bool
    public var alarmSound: String
    public var alarmRepeats: Bool
    let notification = UILocalNotification()
    var alarmWasTurnedOff = false
    var alertOnScreen = false

    init(date:NSDate, repeatOnTheseWeekdays:[Weekdays]){
        
        self.date = date
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        
        self.hour = components.hour
        self.minute = components.minute
        
        if(hour>12){
            amIsTrue = false
        }
        else{
            self.amIsTrue = true
        }
        
        self.alarmIsOn = true
        self.alarmSound = "bell.mp3"
        self.repeatOnTheseWeekdays = repeatOnTheseWeekdays
        if repeatOnTheseWeekdays.count != 0{
            self.alarmRepeats = true
        }
        else{
            self.alarmRepeats = false
        }
        super.init()
        createNotification()
    }
    
    func createNotification(){
        if alarmRepeats{
            date = date.dateByAddingTimeInterval(smallestDifference() * dayInSeconds)
        }
        notification.fireDate = date
        notification.soundName = alarmSound
        notification.alertBody = createAlarmMessage()
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func createNotificationFromDate(newDate:NSDate){
        notification.fireDate = newDate
        notification.alertBody = "You missed " + createAlarmMessage()
        notification.soundName = alarmSound
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func createAlert(view:UITableViewController, currentAlarm:Alarm){
        if !alertOnScreen{
            // Alert Message //
            let alertMessage:String = createAlarmMessage()
            
            let alert:UIAlertController! = UIAlertController(title: "Alarm!", message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
            alertOnScreen = true
            // Alert actions
            alert.addAction(UIAlertAction(title: "Snooze", style: .Default, handler: { (action: UIAlertAction!) in
                audioPlayer.stop()
                self.alertOnScreen = false
            }))
            
            alert.addAction(UIAlertAction(title: "Stop", style: .Default, handler: { (action: UIAlertAction!) in
                audioPlayer.stop()
                self.alarmWasTurnedOff = true
                self.alertOnScreen = false
            }))
            view.presentViewController(alert, animated: true, completion: nil)
            }
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: #selector(Alarm.snoozeAlarm), userInfo: nil, repeats: false)
    }
    
    func snoozeAlarm(){
        if !alarmWasTurnedOff{
            createNotificationFromDate(NSDate())
        }
        else if alarmRepeats{
            date = date.dateByAddingTimeInterval(dayInSeconds)
            createNotification()
        }
    }
    
    func turnAlarmOn(){
        alarmIsOn = true
        createNotification()
    }
    
    func turnAlarmOff(){
        alarmIsOn = false
        UIApplication.sharedApplication().cancelLocalNotification(notification)
    }
    
    func createAlarmMessage()->String{
        var alarmMessage:String
        
        if(hour>12){
            hour = hour - 12
        }
        else if(hour == 0){
            hour = 12
        }
        
        if(minute<10){
            alarmMessage = "Alarm for " + String(hour) + ":0" + String(minute)
        }
        else{
            alarmMessage = "Alarm for " + String(hour) + ":" + String(minute)
        }
        return alarmMessage
    }
    
    func getWeekday(date: NSDate)->Int{
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let myComponents = myCalendar.components(.Weekday, fromDate: date)
        let weekday = myComponents.weekday
        // App weekday count starts at 0 //
        return weekday - 1
    }
    
    func smallestDifference()->Double{
        var difference:Int
        var smallestDifference = 6 // 6 is max difference of days to be apart //
        let currentWeekday = getWeekday(date)
        for weekday in repeatOnTheseWeekdays{
            difference =  weekday.rawValue - currentWeekday
            if difference < 0{
                difference += 7
            }
            if difference < smallestDifference{
                smallestDifference = difference
            }
        }
        return Double(smallestDifference)
    }

} */

// List containing all of the alarms //
var alarmList: [Alarm] = [
]
 
