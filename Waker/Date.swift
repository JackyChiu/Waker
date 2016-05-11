//
//  Date.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-05-09.
//  Copyright © 2016 Jacky Chiu. 
//

class Date{
    var date: NSDate
    var hour: Int
    var minute: Int
    let amIsTrue: Bool
    
    init(date:NSDate) {
        self.date = date
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: self.date)
        
        self.hour = components.hour
        self.minute = components.minute
        
        if hour > 12 {
            self.amIsTrue = true
        }
        else{
            self.amIsTrue = false
        }
    }
    
}