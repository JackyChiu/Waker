//
//  AlarmOptionsTableViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-20.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

class AlarmOptionsTableViewController: UITableViewController {
    
    // MARK: IBOutlets and varibles
    @IBOutlet weak var repeatSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var sunButton: UIButton!
    
    @IBAction func sunButtonDidTouch(sender: AnyObject) {
        sunButton.tintColor = UIColor.blueColor()
        sunButton.backgroundColor = UIColor.lightGrayColor()
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
    
    override func viewDidLoad() {
        // Gives view curved edges //
        self.tableView.layer.cornerRadius = 8
        
        // Listens for when user makes alarm //
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addAlarm:", name: "addAlarm", object: nil)
        
    }
    
    // MARK: Misc
    // Allows for repeat options to pop in and out //
    @IBAction func repeatSwitchToggle(sender: AnyObject) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 160.0
        }
        else if indexPath.row == 3 && !repeatSwitch.on{
            return 0.0
        }
        return 40.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        //Gets rid of extra cells lines //
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
}
