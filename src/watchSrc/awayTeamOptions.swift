//
//  awayTeamOptions.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class awayTeamOptions: WKInterfaceController {
    var scoreRedYellow : Int = 0;
    var timer = Timer()
    var localTime: Int = matchDetails.currentTime
    
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
        matchDetails.currentTime = localTime
    }
    
    @objc func timeCounting(){
        localTime -= 1
        if(localTime < 1){
            timer.invalidate()
        }
    }
    
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if(segueIdentifier == "awayGoal"){
            scoreRedYellow = 4
        }else if(segueIdentifier == "awayRed"){
            scoreRedYellow = 5
        }else if(segueIdentifier == "awayYellow"){
            scoreRedYellow = 6
        }
        return ["scoreRedYellowData": scoreRedYellow]
    }
}
