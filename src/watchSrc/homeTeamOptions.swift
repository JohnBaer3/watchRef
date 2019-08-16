//
//  homeTeamOptions.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation

class homeTeamOptions: WKInterfaceController {

    var scoreRedYellow : Int = 0;
    var timer = Timer()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        scheduledTimerWithTimeInterval()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
       super.didDeactivate()
    }

    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounting), userInfo: nil, repeats: true)
    }
    
    @objc func timeCounting(){
        if(matchDetails.currentTime > 1){
            matchDetails.currentTime -= 1
        }
        if(matchDetails.currentTime < 1){
            timer.invalidate()
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if(segueIdentifier == "homeGoal"){
            scoreRedYellow = 1
        }else if(segueIdentifier == "homeRed"){
            scoreRedYellow = 2
        }else if(segueIdentifier == "homeYellow"){
            scoreRedYellow = 3
        }
        return ["scoreRedYellowData": scoreRedYellow]
    }

}
