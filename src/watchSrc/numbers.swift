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

    @IBOutlet weak var playerNumberText: WKInterfaceLabel!
    
    var scoreRedYellow : Int = 0
    var timer = Timer()
    var playerNumber: Int = 0
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let scoreRedYellower = (context as! NSDictionary)["scoreRedYellowData"] as? Int
        scoreRedYellow = scoreRedYellower!
        scheduledTimerWithTimeInterval()
    }
    
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
        if(matchDetails.currentTime > 1){
            matchDetails.currentTime -= 1
        }
        if(matchDetails.currentTime < 1){
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

    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if(scoreRedYellow == 1){
            matchDetails.homeScoresArr.append(playerNumber)
        }else if(scoreRedYellow == 2){
            matchDetails.homeRedsArr.append(playerNumber)
        }else if(scoreRedYellow == 3){
            matchDetails.homeYellowsArr.append(playerNumber)
        }else if(scoreRedYellow == 4){
            matchDetails.awayScoresArr.append(playerNumber)
        }else if(scoreRedYellow == 5){
            matchDetails.awayRedsArr.append(playerNumber)
        }else if(scoreRedYellow == 6){
            matchDetails.awayYellowsArr.append(playerNumber)
        }
        return []
    }
}
