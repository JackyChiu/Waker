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
    @IBOutlet weak var weekdayPicker: MultiSelectSegmentedControl!
    var weekdayList = [Weekdays.Sun,
                        Weekdays.Mon,
                        Weekdays.Tue,
                        Weekdays.Wed,
                        Weekdays.Thu,
                        Weekdays.Fri,
                        Weekdays.Sat]
    /*
    func addAlarm(notification:NSNotification){
        
        let date = datePicker.date
        var repeatOnTheseWeekdays:[Weekdays] = []
        
        for weekday in PermutationGenerator(elements: weekdayList, indices: weekdayPicker.selectedSegmentIndexes){
            repeatOnTheseWeekdays.append(weekday)
        }
        
        alarmList.append(Alarm(date: date, repeatOnTheseWeekdays: repeatOnTheseWeekdays))
    }
    */
    override func viewDidLoad() {
        // Gives view curved edges //
        self.tableView.layer.cornerRadius = 8
        
        // Listens for when user makes alarm //
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AlarmOptionsTableViewController.addAlarm(_:)), name: "addAlarm", object: nil)
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
