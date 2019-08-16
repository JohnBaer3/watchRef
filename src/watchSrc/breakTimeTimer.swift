//
//  breakTimeTimer.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class breakTimeTimer: WKInterfaceController {

    @IBOutlet weak var breakTimeText: WKInterfaceLabel!
    
    var breakTime: Int = 0
    var timer = Timer()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        breakTimeText.setText(String(matchDetails.breakTime))
        breakTime = matchDetails.breakTime
        scheduledTimerWithTimeInterval()
        matchDetails.currentTime = matchDetails.halfTime
    }
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounting), userInfo: nil, repeats: true)
    }
    
    @objc func timeCounting(){
        if(breakTime > 1){
            breakTime = breakTime - 1
            breakTimeText.setText(String(breakTime))
        }
        
        if(breakTime < 1){
            timer.invalidate()
            
            //ring the watch when this happens
            
        }
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
