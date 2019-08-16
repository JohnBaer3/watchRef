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

    @IBOutlet weak var breakTimeText: WKInterfaceLabel!
    
    var breakTime: Int = 0
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    @IBAction func oneClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 1
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func twoClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 2
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func threeClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 3
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func fourClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 4
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func fiveClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 5
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func sixClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 6
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func sevenClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 7
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func eightClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 8
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func nineClick() {
        if(breakTime < 10){
            breakTime *= 10
            breakTime += 9
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func zeroClick() {
        if(breakTime < 10){
            breakTime *= 10
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }
    @IBAction func backSpaceClick() {
        if(breakTime != 0){
            breakTime /= 10
        }
        breakTimeText.setText(String(breakTime))
        matchDetails.breakTime = breakTime
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
}
