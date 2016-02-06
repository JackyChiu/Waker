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
        let hour = alarm.hour
        let minute = alarm.minute
        let amISTrue = alarm.amIsTrue
        let alarmIsOn = alarm.alarmIsOn
        timeLabel.text = String(hour) + ":" + String(minute)
        if(amISTrue){
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
