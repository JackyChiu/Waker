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
    
    @IBAction func createAlarmButtonDidTouch(sender: AnyObject) {
        // Adds alarm in alarm option view //
        NSNotificationCenter.defaultCenter().postNotificationName("addAlarm", object: nil)
        // Calls to reload tableview data //
        NSNotificationCenter.defaultCenter().postNotificationName("reloadTableData", object: nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Misc
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
