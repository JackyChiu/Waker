//
//  MenuViewController.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-18.
//  Copyright © 2016 Jacky Chiu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
