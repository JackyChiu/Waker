//
//  Audio.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-07.
//  Copyright © 2016 Jacky Chiu.
//
import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

func playAudio() {
 
    let filePathToSound = NSBundle.mainBundle().pathForResource("bell", ofType: "mp3")
    
    if let alarmSound = filePathToSound{
        
        let myFilePathURL = NSURL(fileURLWithPath: alarmSound)
        do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: myFilePathURL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }catch
        {
            print("error")
        }
    }
}

