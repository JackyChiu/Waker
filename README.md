# Waker (*Currently in progress*)
An alarm made for iOS built with Swift and in Xcode. The main idea of the application is to have a small task to complete to be able to turn off the alarm. This will encourage for some brain activity when you wake up, making the process of waking up easier. Currently, I'm looking into how the alarm will fire as there are complexities with Apple allowing applications to set alarms will in the background or not active. The design for the alarm is mostly being focused on the iPhone 6 screen.

![alt tag](https://raw.githubusercontent.com/JackyChiu/Waker/master/img/alarm.jpg)

## Current Features
- Create multiple alarms
- Alarm goes off in foreground or background (There are limitations on this, planned to be improved).

## Planned Feature
- Sound alarm even in silent mode
- A small task to complete before alarm turns off
- Display amount of time until you have to wake up
- Notifies you when you should be going to sleep based on alarm
- Records your sleep duration and graphs it with other in the week
- Notifies you when your amount of sleep has been going down
- Gradually increase the sound of the alarm at the set time
- Responsive design for all iOS screens

## Installation
Mac:
- Clone the repo 
- Open project file in Xcode 7.0 or higher
- Select simulator to run on
- Run

iOS:
- Do above steps for Mac
- Connect device to Mac
- Choose your device to run on in top left coner
- Run

## Project Progress
(Updated Feb 7)
Created notifications that sysc up with in app sounds in order to create alarms.

(Updated Feb 5)
Created static data of alarms that can be created and deleted as table cells.

(Updated Jan 14)
Started project with some basis design.