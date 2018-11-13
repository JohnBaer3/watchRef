//
//  restTime.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class restTime: WKInterfaceController {

    var homeScoresArr: [Int] = []
    var awayScoresArr: [Int] = []
    var homeYellowsArr: [Int] = []
    var awayYellowsArr: [Int] = []
    var homeRedsArr: [Int] = []
    var awayRedsArr: [Int] = []
    var matchArr: [String] = ["0","0","0","0"]
    
    
    @IBOutlet weak var breakTimeText: WKInterfaceLabel!
    var breakTime: Int = 0
    
    @IBAction func oneClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 1
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func twoClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 2
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func threeClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 3
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func fourClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 4
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func fiveClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 5
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func sixClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 6
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func sevenClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 7
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func eightClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 8
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func nineClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 9
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func zeroClick() {
        if(breakTime < 10){
            breakTime *= 10
        }
        breakTimeText.setText(String(breakTime))
    }
    @IBAction func backSpaceClick() {
        if(breakTime != 0){
            breakTime /= 10
        }
        breakTimeText.setText(String(breakTime))
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
        print(matchArr[1])
        print(matchArr[2])
        
        
        var homeScoresData = (context as! NSDictionary)["homeScoresData"] as? [Int]
        var homeYellowsData = (context as! NSDictionary)["homeYellowsData"] as? [Int]
        var homeRedsData = (context as! NSDictionary)["homeRedsData"] as? [Int]
        var awayScoresData = (context as! NSDictionary)["awayScoresData"] as? [Int]
        var awayYellowsData = (context as! NSDictionary)["awayYellowsData"] as? [Int]
        var awayRedsData = (context as! NSDictionary)["awayRedsData"] as? [Int]
        homeScoresArr = homeScoresData!
        homeYellowsArr = homeYellowsData!
        homeRedsArr = homeRedsData!
        awayScoresArr = awayScoresData!
        awayYellowsArr = awayYellowsData!
        awayRedsArr = awayRedsData!
        
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return ["matchData":matchArr, "homeScoresData": homeScoresArr, "homeYellowsData": homeYellowsArr, "homeRedsData": homeRedsArr, "awayScoresData": awayScoresArr, "awayYellowsData": awayYellowsArr, "awayRedsData": awayRedsArr, "breakData": breakTime]
    }
    
}
