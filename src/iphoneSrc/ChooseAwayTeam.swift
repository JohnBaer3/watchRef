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
    
    var shirtDataSecond: String = "0"
    var matchArr: [String] = ["0","0","0","0"];
    
    @IBOutlet weak var shirtData1: WKInterfaceButton!
    @IBOutlet weak var shirtData2: WKInterfaceButton!
    @IBOutlet weak var shirtData3: WKInterfaceButton!
    var prevClicked: WKInterfaceButton!
    
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
    }
    
    override func willActivate() {

        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var matchData = (context as! NSDictionary)["matchData"] as? [String]
        matchArr = matchData!
        print(matchArr[0])
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        matchArr[1] = shirtDataSecond
        return ["matchData":matchArr]
    }

}
