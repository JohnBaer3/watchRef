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
        let entity = NSEntityDescription.entity(forEntityName: "Match", in: context)
        
        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
        newMatch.setValue(homeTeamText.text, forKey: "homeTeam")
        newMatch.setValue(awayTeamText.text, forKey: "awayTeam")
        
        //where the data gets saved
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
//        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
