//
//  AddAlarmViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-18.
//  Copyright © 2016 Jacky Chiu. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var cancelView: DesignableView!
    @IBOutlet weak var cancelButton: SpringButton!
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelView.animation = "shake"
        cancelView.animate()
        cancelButton.animation = "shake"
        cancelButton.animate()
    }
}
