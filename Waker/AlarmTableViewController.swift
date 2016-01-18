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
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AlarmCell")! as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    override func viewDidLoad() {
        let img = UIImage(named: "Background_big")
        self.view.backgroundColor = UIColor(patternImage: img!)
        tableView.rowHeight = 60
        tableView.separatorColor = UIColor.clearColor()
    }
}
