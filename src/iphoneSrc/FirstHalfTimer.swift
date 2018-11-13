//
//  FirstHalfTimer.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation


class FirstHalfTimer: WKInterfaceController {

    var homeScoresArr: [Int] = []
    var awayScoresArr: [Int] = []
    var homeYellowsArr: [Int] = []
    var awayYellowsArr: [Int] = []
    var homeRedsArr: [Int] = []
    var awayRedsArr: [Int] = []

    var matchArr: [String] = ["0","0","0","0"];
    var timer = Timer()
    var paused : Bool = false
    @IBOutlet weak var timeText: WKInterfaceLabel!
    @IBOutlet weak var homeScore: WKInterfaceLabel!
    @IBOutlet weak var awayScore: WKInterfaceLabel!
    
    @IBAction func stopClick() {
        paused = !paused
    }

    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounting), userInfo: nil, repeats: true)
    }
    
    @objc func timeCounting(){
        if(!paused){
            matchArr[2] = String(Int(matchArr[2])! - 1)
            timeText.setText(matchArr[2])
        }
        if(Int(matchArr[2])! < 1){
            timer.invalidate()
            
            //add popup that says that the timer ended, and add a button that moves the user to the next
            //add alarm 
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
        print(matchArr[1])
        print(matchArr[2])
        print(matchArr[3])
        
        timeText.setText(String(matchArr[2]))
        scheduledTimerWithTimeInterval()
        
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
        
        
        homeScore.setText(String(homeScoresArr.count - 1))
        awayScore.setText(String(awayScoresArr.count - 1))
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return ["matchData":matchArr, "homeScoresData": homeScoresArr, "homeYellowsData": homeYellowsArr, "homeRedsData": homeRedsArr, "awayScoresData": awayScoresArr, "awayYellowsData": awayYellowsArr, "awayRedsData": awayRedsArr]
    }

}
