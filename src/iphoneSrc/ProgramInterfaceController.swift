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
    var homeTemp: String = "";
    var awayTemp: String = "";
    var halfTemp: String = "";
    
    
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


    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        
        return ["matchData":matchArr]
    }
    
    
    override func willActivate() {
        super.willActivate()
        
        //make sure it's reachable
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
                            
//                            self.matchArr[0] = prog.homeName!
//                            self.matchArr[1] = prog.awayName!
//                            self.matchArr[2] = prog.halfTime!
//                            self.matchArr[3] = prog.halfTime!
//
//                            self.nameArr[0] = prog.homeName!
//                            self.nameArr[1] = prog.awayName!
//                            self.nameArr[2] = prog.date!
//                            self.nameArr[3] = prog.time!
                            
                            row.lblTitle.setText(prog.homeName)
                            row.lblSpeaker.setText(prog.time)
                            row.lblFrom.setText(prog.date)
                            row.lblTo.setText(prog.awayName)
                            row.halfTime.setText(prog.halfTime)
                            
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
