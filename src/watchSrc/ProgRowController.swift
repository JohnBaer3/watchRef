//
//  ProgRowController.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit

//This is each individual button that gets created programmatically when the user navigates to the new view

class ProgRowController: NSObject {

    @IBOutlet weak var dateAndTime: WKInterfaceButton!
    
    var halfTime: Int!
    
    
    @IBAction func dateTimeClick() {
        matchDetails.halfTime = halfTime
    }
    
    @IBAction func teamNamesClick() {
        
    }
}
