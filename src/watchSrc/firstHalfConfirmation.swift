//
//  firstHalfConfirmation.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/5/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class firstHalfConfirmation: WKInterfaceController {
    
    @IBOutlet weak var minutesText: WKInterfaceLabel!
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        minutesText.setText(String(matchDetails.halfTime))
        matchDetails.currentTime = matchDetails.halfTime
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
