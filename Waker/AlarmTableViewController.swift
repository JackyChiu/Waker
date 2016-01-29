//
//  AlarmTableViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-13.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

class AlarmTableViewController: UITableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        // Returns 1 default cell for testing
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AlarmCell")! as UITableViewCell
        //Transparent background to match background colour
        cell.backgroundColor = UIColor(red: 3/255, green: 69/255, blue: 121/255, alpha: 0.7)
        
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
        
        //tableView.separatorColor = UIColor.clearColor()
    }
    
    @IBAction func addAlarmButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("AddAlarmSegue", sender: self)
    }
    
    @IBAction func MenuButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }
}
