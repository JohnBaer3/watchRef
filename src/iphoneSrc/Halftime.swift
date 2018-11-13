//
//  Halftime.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class Halftime: WKInterfaceController {

    var matchArr: [String] = ["0","0","0","0"];
    var halfTime: Int = 0
    @IBOutlet weak var halfTimeText: WKInterfaceLabel!
    
    @IBAction func oneClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 1
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func twoClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 2
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func threeClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 3
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func fourClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 4
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func fiveClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 5
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func sixClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 6
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func sevenClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 7
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func eightClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 8
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func nineClick() {
        if(halfTime < 10){
            halfTime *= 10
            halfTime += 9
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func zeroClick() {
        if(halfTime < 10){
            halfTime *= 10
        }
        halfTimeText.setText(String(halfTime))
    }
    @IBAction func backSpaceClick() {
        if(halfTime != 0){
            halfTime /= 10
        }
        halfTimeText.setText(String(halfTime))
    }
    
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var matchData = (context as! NSDictionary)["matchData"] as? [String]
        matchArr = matchData!
        print(matchArr[0])
        print(matchArr[1])
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        matchArr[2] = String(halfTime)
        matchArr[3] = String(halfTime)
        return ["matchData":matchArr]
    }
    
}
