//
//  SecondHalfTimer.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation

class SecondHalfTimer: WKInterfaceController {

    @IBOutlet weak var timeText: WKInterfaceLabel!
    @IBOutlet weak var homeScore: WKInterfaceLabel!
    @IBOutlet weak var awayScore: WKInterfaceLabel!
    
    var timer = Timer()
    var paused : Bool = false
    var localTime: Int = matchDetails.currentTime
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        timeText.setText(String(matchDetails.currentTime))
        scheduledTimerWithTimeInterval()
        homeScore.setText(String(matchDetails.homeScoresArr.count ?? 0))
        awayScore.setText(String(matchDetails.awayScoresArr.count ?? 0))
    }
    
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounting), userInfo: nil, repeats: true)
    }
    
    @objc func timeCounting(){
        if(!paused){
            localTime -= 1
            timeText.setText(String(localTime))
        }
        if(localTime < 1){
            timer.invalidate()
            
            //add popup that says that the timer ended, and add a button that moves the user to the next
            //add alarm
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        matchDetails.currentTime = localTime
        return ""
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
