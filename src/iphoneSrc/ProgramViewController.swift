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

//This is the view that shows the matches that were stored into CoreData. It also sends the data in this view to
//  the watch using WatchConnectivity

class ProgramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WCSessionDelegate {
    //array of objects that store the fake data
    var programs: [ProgramObject] = []
    //test the timing between messages
    var lastMessage : CFAbsoluteTime = 0
    
    
    //Check to see if the watch is connected, then
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
    
    
    //launch extra code if there's print statement, alert stuff, etc
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    //Goes through all the current matches, prints out all the homeTeam names
    @IBAction func printButtonclicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MatchArr")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "homeTeam") as! String)
            }
        } catch {
            print("Failed")
        }
    }
    
    
    //This is for when I receive messages from the watch.
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MatchArr", in: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MatchArr")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            var i = 0;
            //Go through all the data
            for data in result as! [NSManagedObject] {
                //Make a new ProgramObject instance
                let progObj = ProgramObject()
                //Initialize the new instance with the data that was stored
                progObj.initWithData(homeName: data.value(forKey: "homeTeam") as! String, time: data.value(forKey: "time") as! String, date: data.value(forKey: "date") as! String, awayName: data.value(forKey: "awayTeam") as! String, halfTime: data.value(forKey: "halfTime") as! String)
                //Add the new instance into a ProgramObject array
                programs.insert(progObj, at: i)
                i += 1
            }
        } catch {
            print("Failed")
        }
        //Send the data off to the watch
        let programData = NSKeyedArchiver.archivedData(withRootObject: programs)
        sendWatchMessage(programData)
    }
    
    
    //Take the message from the last function, and send it to the watch. Keep sending until it works.
    func sendWatchMessage(_ msgData: Data){
        let currentTime = CFAbsoluteTimeGetCurrent()
        //so we don't resend a message too soon
        if lastMessage + 0.5 > currentTime{
            return
        }
        //when the phone and watch aren't out of range
        if (WCSession.default.isReachable){
            let message = ["progData" : msgData]
            //send
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        //each time you check for message, you'll get the last time you sent a message
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
    
    //Gets the number of datas(matches) in coreData
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    
    //Makes the tableViews, and instantiates the cells with the data that was stored 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //try to retrieve a table cell
        //imagine a scenario where a table is trying to come in, and repopulate a table here with the information
        //double question mark means if NIL - then instantiate a table
        let tableCell : ProgramTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProgramCell") as? ProgramTableViewCell ??
            //instantiate a cell
            ProgramTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ProgramCell")
        //retrieve item from the array
        var row = indexPath.row
        var rowObj = programs[row]
        tableCell.homeName.text = rowObj.homeName as String?
        tableCell.time.text = rowObj.time as String?
        tableCell.date.text = rowObj.date as String?
        tableCell.awayName.text = rowObj.awayName as String?
        tableCell.halfTime.text = rowObj.halfTime as String?
        
        return tableCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //to add event handlers for each cell
    }
}
