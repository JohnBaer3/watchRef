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
    
    //Text field for adding a new match
    @IBOutlet weak var homeTeamText: UITextField!
    @IBOutlet weak var awayTeamText: UITextField!
    @IBOutlet weak var halfTimeText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //date part
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
    }
    
    @IBAction func dateClick(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        print(formatter.string(from: datePicker.date))
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MatchArr", in: context)
        //The new match
        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
        newMatch.setValue(homeTeamText.text, forKey: "homeTeam")
        newMatch.setValue(awayTeamText.text, forKey: "awayTeam")
        newMatch.setValue(locationText.text, forKey: "location")
        newMatch.setValue(halfTimeText.text, forKey: "halfTime")
        newMatch.setValue(dateText.text, forKey: "date")
        newMatch.setValue(timeText.text, forKey: "time")
        
        //where the data gets saved
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }

    }
}
