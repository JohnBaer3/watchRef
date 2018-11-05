//
//  programViewController.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit
import CoreData
import WatchConnectivity

class ProgramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WCSessionDelegate {

    //array of objects that store the fake data
    var programs: [ProgramObject] = []
    
    //test the timing between messages
    var lastMessage : CFAbsoluteTime = 0
    
    
    //launch extra code if there's print statement, alert stuff, etc
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    @IBAction func printButtonclicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "homeTeam") as! String)
//                context.delete(data)
//                try context.save()
            }
        } catch {
            print("Failed")
        }

    }
    
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        //deserialize any data that came in
        var replyValues = Dictionary<String, AnyObject>()
        
        //check to see if we got the message getProgData, and if it doesn't equal nil
        if(message["getProgData"] != nil){
            NSKeyedArchiver.setClassName("ProgramObject", for:ProgramObject.self)
            
            //archive data
            let programData = NSKeyedArchiver.archivedData(withRootObject: programs)
            
            //send the data
            //Our watch is gonna say getProgData, send it to us, on the phone we receive the message called getProgData
            //take our array of objects, serialize it, and send it off with a label called progData
            //watch looks for data called progData, and deserialize that data as a array of program items and display it in its table view
            replyValues["progData"] = programData as AnyObject?
            replyHandler(replyValues)
        }
    }
    
    
    //Where I make the objects of the data
    func initFakeDetails(){
        //has to have
        //home, away, halftime, location, date, time
        
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Match", in: context)
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
//        //request.predicate = NSPredicate(format: "age = %@", "12")
//        request.returnsObjectsAsFaults = false
//        do {
//            let result = try context.fetch(request)
//            var i = 0;
//            for data in result as! [NSManagedObject] {
//                let progObj = ProgramObject()
//                progObj.initWithData(title: data.value(forKey: "homeTeam") as! String, speaker: data.value(forKey: "awayTeam") as! String, from: data.value(forKey: "time") as! String, to: data.value(forKey: "date") as! String, details: data.value(forKey: "location") as! String)
//
//                programs.insert(progObj, at: i)
//                i+=1;
//            }
//        } catch {
//            print("Failed")
//        }
        
        
//        let progObj = ProgramObject()
//        let progObj2 = ProgramObject()
//        let progObj3 = ProgramObject()
//        let progObj4 = ProgramObject()
//
//        progObj.initWithData(title: "farAndAway", speaker: "Gym Kirk", from: "Fri Oct 23", to: "Thur Oct 24", details: "Must Watch")
//        progObj2.initWithData(title: "Bla2", speaker: "Matthew Daniels", from: "Mon Sep 10", to: "Sat Jan 10", details: "Must Hear")
//        progObj3.initWithData(title: "Blo3", speaker: "Gorilla Bob", from: "Wed July 10", to: "Wed September 20", details: "Must See")
//        progObj4.initWithData(title: "Ble4", speaker: "Hans Mitchell", from: "Tues June 3", to: "Fri Nov 9", details: "Must Experience")

//        programs.insert(progObj, at: 0)
//        programs.insert(progObj2, at: 1)
//        programs.insert(progObj3, at: 2)
//        programs.insert(progObj4, at: 3)
        
        //send the data off to the watch
        let programData = NSKeyedArchiver.archivedData(withRootObject: programs)
        sendWatchMessage(programData)
    }
    
    
    func sendWatchMessage(_ msgData: Data){
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        //so we don't resend a message too soon
        if lastMessage + 0.5 > currentTime{
            return
        }
        
        //when the phone and watch are out of range
        if (WCSession.default.isReachable){
            let message = ["progData" : msgData]
            //send
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        
        //each time you check for message, you'll get the last time you sent a message
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //if statements to make sure watch is connected properly, and catch any problems
        //make sure the watch and the phone pairs
        if(WCSession.isSupported()){
            let session = WCSession.default
            session.delegate = self
            session.activate()
            
            if session.isPaired != true{
                print("Apple watch is not paired")
            }
            
            if session.isWatchAppInstalled{
                print("Watchkit app is not installed")
            }
        }else{
            print("Watch Connectivity is not supported on this device")
        }
        
        
        //makes the data on load
        initFakeDetails()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //try to retrieve a table cell
        //imagine a scenario where a table is trying to come in, and repopulate a table here with the information
        let tableCell : ProgramTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProgramCell") as? ProgramTableViewCell ??
            //double question mark means if NIL - then instantiate a table
            
            //instantiate a cell
            ProgramTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ProgramCell")
        
        //retrieve item from the array
        var row = indexPath.row
        var rowObj = programs[row]
        
        tableCell.title.text = rowObj.title as String?
        tableCell.speaker.text = rowObj.speaker as String?
        tableCell.from.text = rowObj.from as String?
        tableCell.to.text = rowObj.to as String?
        
        return tableCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //to add event handlers for each cell
    }
    
    

}
