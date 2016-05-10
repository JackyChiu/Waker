//
//  AddAlarmViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-18.
//  Copyright © 2016 Jacky Chiu.
//

import UIKit

class AddAlarmViewController: UIViewController {

  
    @IBOutlet weak var cancelButton: DesignableButton!
    @IBOutlet weak var createButton: DesignableButton!
    
    @IBAction func createAlarmButtonDidTouch(sender: AnyObject) {
        // Adds alarm in alarm option view //
        //NSNotificationCenter.defaultCenter().postNotificationName("addAlarm", object: nil)
        // Calls to reload tableview data //
        //NSNotificationCenter.defaultCenter().postNotificationName("reloadTableData", object: nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.view.layer.cornerRadius = 8;
    }
    
    override func viewWillAppear(animated: Bool) {
        cancelButton.animation = "slideRight"
        cancelButton.damping = 0.9
        cancelButton.animate()
        
        createButton.animation = "slideLeft"
        createButton.damping = 0.9
        createButton.animate()
    }
}
