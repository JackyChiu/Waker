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
    public var weekday: [Weekdays]!
    public var alarmIsOn: Bool
    public var alarmSound: String
    
    init(date:NSDate, hour:Int, minute:Int, am:Bool){
        self.date = date
        self.hour = hour
        self.minute = minute
        self.amIsTrue = am
        self.alarmIsOn = true
        self.alarmSound = "bell.mp3"
        super.init()
        createNotification()
    }
    
    func createNotification(){
        let notification = UILocalNotification()
        notification.fireDate = date
        notification.alertBody = "Alarm went off!"
        notification.soundName = alarmSound
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func createNotificationFromDate(mintueAfterSnooze:NSDate){
        let notification = UILocalNotification()
        notification.fireDate = mintueAfterSnooze
        notification.alertBody = "Alarm went off!"
        notification.soundName = alarmSound
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func createAlert(view:UITableViewController, currentAlarm:Alarm){
        let alert = UIAlertController(title: "Alarm!", message: "Wake up sleepy head!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Snooze", style: .Default, handler: { (action: UIAlertAction!) in
            print("Snooze")
            audioPlayer.stop()
            currentAlarm.createNotificationFromDate(NSDate(timeIntervalSinceNow: minuteInSeconds))
        }))
        
        alert.addAction(UIAlertAction(title: "Stop", style: .Default, handler: { (action: UIAlertAction!) in
            print("Stop")
            audioPlayer.stop()
        }))
        view.presentViewController(alert, animated: true, completion: nil)

    }
    
    func turnAlarmOff(){
        alarmIsOn = false
    }

}

// List containing all of the alarms //
var alarmList: [Alarm] = [
    
]