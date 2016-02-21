//
//  AlarmOptionsTableViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-20.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

class AlarmOptionsTableViewController: UITableViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    override func viewWillAppear(animated: Bool) {
        //Gets rid of extra cells lines //
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewDidLoad() {
        self.tableView.layer.cornerRadius = 8
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addAlarm:", name: "addAlarm", object: nil)
    }
    
    func addAlarm(notification:NSNotification){
        
        let date = datePicker.date
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        var amIsTrue = true
        
        if(hour>12){
            amIsTrue = false
        }
        
        alarmList.append(Alarm(date: date, hour: hour, minute: minutes, am: amIsTrue))
    }
    
    
}
