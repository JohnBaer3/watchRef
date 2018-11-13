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
    
    var homeScoresArr: [Int] = []
    var awayScoresArr: [Int] = []
    var homeYellowsArr: [Int] = []
    var awayYellowsArr: [Int] = []
    var homeRedsArr: [Int] = []
    var awayRedsArr: [Int] = []
    
    var matchArr: [String] = ["0","0","0","0"];
    @IBOutlet weak var minutesText: WKInterfaceLabel!
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var matchData = (context as! NSDictionary)["matchData"] as? [String]
        matchArr = matchData!
        print(matchArr[0])
        print(matchArr[1])
        print(matchArr[2])
        print(matchArr[3])
        minutesText.setText(String(matchArr[2]))
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        homeScoresArr.append(0)
        homeYellowsArr.append(0)
        homeRedsArr.append(0)
        awayScoresArr.append(0)
        awayYellowsArr.append(0)
        awayRedsArr.append(0)
        
        return ["matchData":matchArr, "homeScoresData": homeScoresArr, "homeYellowsData": homeYellowsArr, "homeRedsData": homeRedsArr, "awayScoresData": awayScoresArr, "awayYellowsData": awayYellowsArr, "awayRedsData": awayRedsArr]
    }

}
