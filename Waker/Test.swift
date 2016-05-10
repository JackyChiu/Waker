//
//  Test.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-05-09.
//  Copyright © 2016 Jacky Chiu. All rights reserved.
//


class Test: UIViewController {
    override func viewDidLoad() {
        //Sets background image //
        let img = UIImage(named: "Background_big")
        self.view.backgroundColor = UIColor(patternImage: img!)
    }
}
