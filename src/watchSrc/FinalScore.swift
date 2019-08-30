//
//  FinalScore.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class FinalScore: WKInterfaceController {

    @IBOutlet weak var score1: WKInterfaceLabel!
    @IBOutlet weak var score2: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        score1.setText(String(matchDetails.homeScoresArr.count))
        score2.setText(String(matchDetails.awayScoresArr.count))
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
//    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
//        return ["matchData":matchArr, "matchDetails":matchDetail]
//    }
}
