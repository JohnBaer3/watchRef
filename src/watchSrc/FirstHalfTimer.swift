//
//  FirstHalfTimer.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation

//This is the screen for the timer for the first half of the match - shows the amount of points either team scored,
//  and has a countdown for the half's time
class FirstHalfTimer: WKInterfaceController {
    
    @IBOutlet weak var timeText: WKInterfaceLabel!
    @IBOutlet weak var homeScore: WKInterfaceLabel!
    @IBOutlet weak var awayScore: WKInterfaceLabel!
    
    var timer = Timer()
    var paused : Bool = false
    var localTime: Int = matchDetails.currentTime
    
    
    //Grab the matchArr data, grab the matchDetails (scores, cards), update the text to how many goals were scored
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        timeText.setText(String(matchDetails.currentTime))
        scheduledTimerWithTimeInterval()
        homeScore.setText(String(matchDetails.homeScoresArr.count))
        awayScore.setText(String(matchDetails.awayScoresArr.count))
    }
    
    
    @IBAction func stopClick() {
        paused = !paused
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
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    
}
