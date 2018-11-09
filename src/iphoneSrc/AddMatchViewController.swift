//
//  AddMatchViewController.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 11/3/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit
import CoreData

class AddMatchViewController: UIViewController {

    
    @IBOutlet weak var homeTeamText: UITextField!
    @IBOutlet weak var awayTeamText: UITextField!
    @IBOutlet weak var halfTimeText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Matches", in: context)

        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
        newMatch.setValue("bla", forKey: "homeTeam")
        newMatch.setValue("ble", forKey: "awayTeam")
        newMatch.setValue("blu", forKey: "location")
        newMatch.setValue("bli", forKey: "halfTime")
        newMatch.setValue("blo", forKey: "date")
        newMatch.setValue("ble", forKey: "time")
        
//        newMatch.setValue(homeTeamText.text, forKey: "homeTeam")
//        newMatch.setValue(awayTeamText.text, forKey: "awayTeam")
//        newMatch.setValue(locationText.text, forKey: "location")
//        newMatch.setValue(dateText.text, forKey: "date")
        
        //where the data gets saved
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Matches", in: context)
        
        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
        newMatch.setValue("11", forKey: "homeTeam")
        newMatch.setValue("12", forKey: "awayTeam")
        newMatch.setValue("90", forKey: "location")
        newMatch.setValue("10", forKey: "halfTime")
        newMatch.setValue("900", forKey: "date")
        newMatch.setValue("123", forKey: "time")
        
        //        newMatch.setValue(homeTeamText.text, forKey: "homeTeam")
        //        newMatch.setValue(awayTeamText.text, forKey: "awayTeam")
        //        newMatch.setValue(locationText.text, forKey: "location")
        //        newMatch.setValue(dateText.text, forKey: "date")
        
        //where the data gets saved
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
        // Do any additional setup after loading the view.
    }
    


}