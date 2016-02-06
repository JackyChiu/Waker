//
//  AlarmTableViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-13.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit


class AlarmTableViewController: UITableViewController, AlarmTableViewCellDelegate {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        // Returns the number of alarms
        return alarmList.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AlarmCell") as! AlarmTableViewCell
        //Transparent background to match background colour
        cell.backgroundColor = UIColor(red: 3/255, green: 69/255, blue: 121/255, alpha: 0.7)
        
        let alarm = alarmList[indexPath.row]
        // Get alarmcell formatting and data
        cell.configureWithAlarmCell(alarm)
        cell.delegate = self
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        //Gets rid of extra cells lines
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewDidLoad() {
        //Sets background image
        let img = UIImage(named: "Background_big")
        self.view.backgroundColor = UIColor(patternImage: img!)
        
        //Sets row height
        tableView.rowHeight = 90
        // Listens for if tableview needs to reload
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTableData:", name: "reload", object: nil)
        
       /*
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "viewDidLoad", userInfo: nil, repeats: true)
        
        if(alarm.alarmIsOn){
            if(alarm.hour == hour && alarm.minute == minutes){
                print("ALARM WENT OFF")
            }
        }
        
    }
*/
    }
    
    // Tells tableview to reload
    func reloadTableData(notification: NSNotification) {
        tableView.reloadData()
    }

    // Segues to other screens
    @IBAction func addAlarmButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("AddAlarmSegue", sender: self)
    }
    
    @IBAction func MenuButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }
    
}
