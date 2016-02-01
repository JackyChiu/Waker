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
        // Returns 1 default cell for testing
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AlarmCell") as! AlarmTableViewCell
        //Transparent background to match background colour
        cell.backgroundColor = UIColor(red: 3/255, green: 69/255, blue: 121/255, alpha: 0.7)
        
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
        /*
        let alarm = Alarm(hour: 10, mintue: 57, alarmIsOn: true)
        var date = NSDate()
        var calendar = NSCalendar.currentCalendar()
        var components = calendar.components([.Hour, .Minute], fromDate: date)
        var hour = components.hour
        var minutes = components.minute

        print(hour)
        print(minutes)
        print(alarm.hour)
        print(alarm.mintue)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "viewDidLoad", userInfo: nil, repeats: true)
        
        if(alarm.alarmIsOn){
            if(alarm.hour == hour && alarm.mintue == minutes){
                print("ALARM WENT OFF")
            }
        }
        
    }
    
    func updateDate(){
        date = NSDate()
        calendar = NSCalendar.currentCalendar()
        components = calendar.components([.Hour, .Minute], fromDate: date)
        hour = components.hour
        minutes = components.minute
    }
*/
    }
    
    // Segues to other screens
    @IBAction func addAlarmButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("AddAlarmSegue", sender: self)
    }
    
    @IBAction func MenuButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }
}
