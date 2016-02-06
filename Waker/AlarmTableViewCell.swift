//
//  AlarmTableViewCell.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-01-29.
//  Copyright © 2016 Jacky Chiu. All rights reserved.
//

import UIKit

protocol AlarmTableViewCellDelegate: class{
}

class AlarmTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ampmLabel: UILabel!
    @IBOutlet weak var weekdaysLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    weak var delegate: AlarmTableViewCellDelegate?
    
    func configureWithAlarmCell(alarm: Alarm){
        var hour = alarm.hour
        let minute = alarm.minute
        let amIsTrue = alarm.amIsTrue
        let alarmIsOn = alarm.alarmIsOn
        
        if(hour>12){
            hour = hour - 12
        }
        else if(hour == 0){
            hour = 12
        }

        if(minute<10){
            timeLabel.text = String(hour) + ":0" + String(minute)
        }
        else{
            timeLabel.text = String(hour) + ":" + String(minute)
        }
        if(amIsTrue){
            ampmLabel.text = "AM"
        }
        else{
            ampmLabel.text = "PM"
        }
        if(alarmIsOn){
            onSwitch.on = true
        }
        else{
            onSwitch.on = false
        }
        
        
    }
}
