//
//  ProgramInterfaceController.swift
//  WatchConferenceConnectApp WatchKit Extension
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class ProgramInterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var progTable : WKInterfaceTable!
    var programs : [ProgramObject] = []
    var matchArr: [String] = ["0","0","0","0"];
    var nameArr: [String] = ["", "", "", ""]
    var homeTemp: String = ""
    var awayTemp: String = ""
    var halfTemp: String = ""
    var chooseMatch: Int = 0
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        //When this session is called, deserialize the data that we have
        var replyValues = Dictionary<String, AnyObject>()
        let loadedData = message["progData"]
        //because on the watch side, decode the information that was sent
        let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [ProgramObject]
        //programs is the table array, pass the data we received (loadedPerson) into the programs array
        programs = loadedPerson!
        //send message back saying, program received
        replyValues["status"] = "Program Received" as AnyObject?
        replyHandler(replyValues)
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //if the session is supported, then activate the session
        if(WCSession.isSupported()){
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    
    
    override func willActivate() {
        super.willActivate()
//        make sure it's reachable
        if(WCSession.default.isReachable){
            //sends a message to say getProgData
            //tell the phone hey I want some data, send it to me
            let message = ["getProgData": [:]]
            WCSession.default.sendMessage(message, replyHandler:
                {(result) -> Void in
                    if result["progData"] != nil{
                    // the phone sent data called progData, so we're looking for it here
                        let loadedData = result["progData"]
                        NSKeyedUnarchiver.setClass(ProgramObject.self, forClassName: "ProgramObject")
                        let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [ProgramObject]
                        self.programs = loadedPerson!
                        self.progTable.setNumberOfRows(self.programs.count, withRowType: "ProgRowController")

                        //loop throught the cells and display
                        for(index, prog) in self.programs.enumerated(){
                            let row = self.progTable.rowController(at: index) as! ProgRowController
                            let tempTeams:String = prog.homeName! + " " + prog.awayName!
                            //row.teamNamesVs.setTitle(tempTeams)
                            let dateTime:String = prog.date! + " " + prog.time!
                            row.dateAndTime.setTitle(dateTime)
                            row.halfTime = Int(prog.halfTime!)
                            
                            //Make this a click-once, then second click for segue
                            //  When this button is clicked, change the value of chooseNum to counter
                        }
                    }
                }, errorHandler: {(error) -> Void in
                print(error)
            })
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    
    
    
}
