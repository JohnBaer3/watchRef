//
//  numbers.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/6/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation

//make modal happen after the button
//make the button happen before the modal
//make the button push another sort of data to the new view
//figure out which button pushed stuff to the new view at the new view
    //by far too hard



class numbers: WKInterfaceController {

    var matchArr : [String] = ["0","0","0","0"]
    var scoreRedYellow : Int = 0
    var timer = Timer()
    var homeScoresArr: [Int] = []
    var awayScoresArr: [Int] = []
    var homeYellowsArr: [Int] = []
    var awayYellowsArr: [Int] = []
    var homeRedsArr: [Int] = []
    var awayRedsArr: [Int] = []
    
    var playerNumber: Int = 0
    @IBOutlet weak var playerNumberText: WKInterfaceLabel!
    
    @IBAction func oneClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 1
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func twoClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 2
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func threeClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 3
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func fourClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 4
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func fiveClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 5
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func sixClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 6
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func sevenClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 7
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func eightClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 8
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func nineClick() {
        if(playerNumber < 10){
            playerNumber *= 10
            playerNumber += 9
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func zeroClick() {
        if(playerNumber < 10){
            playerNumber *= 10
        }
        playerNumberText.setText(String(playerNumber))
    }
    @IBAction func backSpaceClick() {
        if(playerNumber != 0){
            playerNumber /= 10
        }
        playerNumberText.setText(String(playerNumber))
    }
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounting), userInfo: nil, repeats: true)
        
    }
    
    @objc func timeCounting(){
        if(Int(matchArr[2])! > 1){
            matchArr[2] = String(Int(matchArr[2])! - 1)
        }
        
        if(Int(matchArr[2])! < 1){
            timer.invalidate()
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
        var scoreRedYellowData = (context as! NSDictionary)["scoreRedYellowData"] as? Int
        homeScoresArr = homeScoresData!
        homeYellowsArr = homeYellowsData!
        homeRedsArr = homeRedsData!
        awayScoresArr = awayScoresData!
        awayYellowsArr = awayYellowsData!
        awayRedsArr = awayRedsData!
        scoreRedYellow = scoreRedYellowData!
        scheduledTimerWithTimeInterval()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        if(scoreRedYellow == 1){
            homeScoresArr.append(playerNumber)
        }else if(scoreRedYellow == 2){
            homeRedsArr.append(playerNumber)
        }else if(scoreRedYellow == 3){
            homeYellowsArr.append(playerNumber)
        }else if(scoreRedYellow == 4){
            awayScoresArr.append(playerNumber)
        }else if(scoreRedYellow == 5){
            awayRedsArr.append(playerNumber)
        }else if(scoreRedYellow == 6){
            awayYellowsArr.append(playerNumber)
        }
        
        
        return ["matchData":matchArr, "homeScoresData": homeScoresArr, "homeYellowsData": homeYellowsArr, "homeRedsData": homeRedsArr, "awayScoresData": awayScoresArr, "awayYellowsData": awayYellowsArr, "awayRedsData": awayRedsArr]
    }
}
