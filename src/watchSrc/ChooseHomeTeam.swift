//
//  ChooseHomeInterfaceController.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation

class ChooseHomeTeam: WKInterfaceController {
    
    //This is the shirt that was chosen by the user
    var shirtData: String = "0"
    
    @IBOutlet weak var shirtData1: WKInterfaceButton!
    @IBOutlet weak var shirtData2: WKInterfaceButton!
    @IBOutlet weak var shirtData3: WKInterfaceButton!
    var prevClicked: WKInterfaceButton!
    
    @IBAction func shirtClick1() {
        if(prevClicked == shirtData1){
            shirtData = "0"
            prevClicked.setAlpha(1)
            prevClicked = nil
        }else{
            if(prevClicked != nil){
                prevClicked.setAlpha(1)
            }
            prevClicked = shirtData1
            shirtData = "1";
            shirtData1.setAlpha(0.6)
        }
        matchDetails.homeTeamShirt = shirtData
    }
    
    @IBAction func shirtClick2() {
        if(prevClicked == shirtData2){
            shirtData = "0"
            prevClicked.setAlpha(1)
            prevClicked = nil
        }else{
            if(prevClicked != nil){
                prevClicked.setAlpha(1)
            }
            prevClicked = shirtData2
            shirtData = "2";
            shirtData2.setAlpha(0.6)
        }
        matchDetails.homeTeamShirt = shirtData
    }
    
    @IBAction func shirtClick3() {
        if(prevClicked == shirtData3){
            shirtData = "0"
            prevClicked.setAlpha(1)
            prevClicked = nil
        }else{
            if(prevClicked != nil){
                prevClicked.setAlpha(1)
            }
            prevClicked = shirtData3
            shirtData = "3";
            shirtData3.setAlpha(0.6)
        }
        matchDetails.homeTeamShirt = shirtData
    }
        
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    

}
