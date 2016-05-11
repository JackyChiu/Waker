//
//  Audio.swift
//  Waker
//
//  Created by Jacky Chiu on 2016-02-07.
//  Copyright © 2016 Jacky Chiu.
//
import UIKit
import AVFoundation

class AudioPlayer: AVAudioPlayer {
    
    static var audioPlayer = AVAudioPlayer()
    var alarmSound:String
    
    init(alarmSound:String) {
        self.alarmSound = alarmSound
        super.init()
    }
    
    static func playAudio() {
        let filePathToSound = NSBundle.mainBundle().pathForResource("bell", ofType: "mp3")
        
        if let soundFile = filePathToSound{
            
            let myFilePathURL = NSURL(fileURLWithPath: soundFile)
            
            do{
                try audioPlayer = AVAudioPlayer(contentsOfURL: myFilePathURL)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
            }catch{
                print("Error locating sound file")
            }
        }
    }
}

//var audioPlayer = AudioPlayer()
