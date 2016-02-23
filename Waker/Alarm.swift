//
//  Alarm.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-01.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

let minuteInSeconds:Double = 60.0

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
    public var date: NSDate
    public var hour: Int
    public var minute: Int
    public var amIsTrue: Bool
    public var repeatOnTheseWeekdays: [Weekdays]!
    public var alarmIsOn: Bool
    public var alarmSound: String
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
        super.init()
        createNotification()
    }
    
    func createNotification(){
        let notification = UILocalNotification()
        // Alarm doesn't repeat //
        if repeatOnTheseWeekdays.count == 0{
            notification.fireDate = date
            print(date)
            notification.soundName = alarmSound
            notification.alertBody = createAlarmMessage()
        }
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func createNotificationFromDate(newDate:NSDate){
        let notification = UILocalNotification()
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
                print("Snooze")
                audioPlayer.stop()
                self.alertOnScreen = false
            }))
            
            alert.addAction(UIAlertAction(title: "Stop", style: .Default, handler: { (action: UIAlertAction!) in
                print("Stop")
                audioPlayer.stop()
                self.alarmWasTurnedOff = true
                self.alertOnScreen = false
            }))
            view.presentViewController(alert, animated: true, completion: nil)
            }
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "snoozeAlarm", userInfo: nil, repeats: false)
    }
    func snoozeAlarm(){
        if !alarmWasTurnedOff{
            createNotificationFromDate(NSDate())
        }
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
    
    func turnAlarmOff(){
        alarmIsOn = false
    }

}

// List containing all of the alarms //
var alarmList: [Alarm] = [
    
]