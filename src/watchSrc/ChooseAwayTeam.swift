//
//  ChooseAwayTeam.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class ChooseAwayTeam: WKInterfaceController {
    
    @IBOutlet weak var shirtData1: WKInterfaceButton!
    @IBOutlet weak var shirtData2: WKInterfaceButton!
    @IBOutlet weak var shirtData3: WKInterfaceButton!
    
    var prevClicked: WKInterfaceButton!
    var shirtDataSecond: String = "0"
    
    @IBAction func shirtClick1() {
        if(prevClicked == shirtData1){
            shirtDataSecond = "0"
            prevClicked.setAlpha(1)
            prevClicked = nil
        }else{
            if(prevClicked != nil){
                prevClicked.setAlpha(1)
            }
            prevClicked = shirtData1
            shirtDataSecond = "1";
            shirtData1.setAlpha(0.6)
        }
        matchDetails.awayTeamShirt = shirtDataSecond
    }
    
    @IBAction func shirtClick2() {
        if(prevClicked == shirtData2){
            shirtDataSecond = "0"
            prevClicked.setAlpha(1)
            prevClicked = nil
        }else{
            if(prevClicked != nil){
                prevClicked.setAlpha(1)
            }
            prevClicked = shirtData2
            shirtDataSecond = "2";
            shirtData2.setAlpha(0.6)
        }
        matchDetails.awayTeamShirt = shirtDataSecond
    }
    
    @IBAction func shirtClick3() {
        if(prevClicked == shirtData3){
            shirtDataSecond = "0"
            prevClicked.setAlpha(1)
            prevClicked = nil
        }else{
            if(prevClicked != nil){
                prevClicked.setAlpha(1)
            }
            prevClicked = shirtData3
            shirtDataSecond = "3";
            shirtData3.setAlpha(0.6)
        }
        matchDetails.awayTeamShirt = shirtDataSecond
    }
    
    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    

}
