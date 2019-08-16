//
//  ViewController.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 10/26/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit
import CoreData


//First view, here we define two IBActions - deleteDataClick, which deletes all the data in CoreData, and addDataClick,
//  which adds dummy data to the data table
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Deletes all the data that is stored
    @IBAction func deleteDataClick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Grabs data from CoreData that has the tag "Matches"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MatchArr")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "homeTeam") as! String)
                context.delete(data)
                try context.save()
            }
        } catch {
            print("Failed")
        }
    }
    
    
    
    //Tester function to add dummy data - so the app won't crash when there's no tables to be made
    @IBAction func addDataClick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Grabs data from CoreData that has the tag "Matches"
        let entity = NSEntityDescription.entity(forEntityName: "MatchArr", in: context)
        //newMatch is the new Object that will be added to the data table
        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
        newMatch.setValue("temp1", forKey: "homeTeam")
        newMatch.setValue("temp2", forKey: "awayTeam")
        newMatch.setValue("temp30", forKey: "location")
        newMatch.setValue("temp4", forKey: "date")
        newMatch.setValue("10", forKey: "halfTime")
        newMatch.setValue("temp6", forKey: "time");
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}

