//
//  AddAlarmViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-18.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var cancelView: DesignableView!
    @IBOutlet weak var cancelButton: DesignableButton!
    @IBOutlet weak var createAlarmView: DesignableView!
    @IBOutlet weak var createAlarmButton: DesignableButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    func createNotification(index: Int){
        let notification = UILocalNotification()
        notification.fireDate = alarmList[index].date
        notification.alertBody = "Alarm went off!"
        notification.soundName = "bell.mp3"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    @IBAction func createAlarmButtonDidTouch(sender: AnyObject) {
        let date = timePicker.date
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        var amIsTrue = true
        
        if(hour>12){
            amIsTrue = false
        }
        
        alarmList.append(Alarm(date: date, hour: hour, minute: minutes, am: amIsTrue))
        createNotification(alarmList.count-1)
        // Sends notifcation for tableview to reload
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        cancelView.animation = "slideRight"
        cancelView.damping = 0.9
        cancelButton.animation = "slideRight"
        cancelButton.damping = 0.9
        cancelView.animate()
        cancelButton.animate()
        
        
        createAlarmView.animation = "slideLeft"
        createAlarmView.damping = 0.9
        createAlarmButton.animation = "slideLeft"
        createAlarmButton.damping = 0.9
        createAlarmView.animate()
        createAlarmButton.animate()
    }
}
