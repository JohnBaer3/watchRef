//
//  ViewController.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 10/26/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit
import CoreData


// - Make the things correctly into int values
// - Make the things correctly into date values
// - Make the things with the same dates collapse into the same block
// - Start working on the formatting
// - Make formatting for done games correct



class ViewController: UIViewController {

    @IBAction func buttonClick(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
//        //this part is to fetch the data - one part of the code is to remove data, one is to print data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Matches")
        //request.predicate = NSPredicate(format: "age = %@", "12")
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
    
    
    
    @IBAction func addData(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Matches", in: context)
        
//        var dateComponents = DateComponents()
//        dateComponents.year = 1980
//        dateComponents.month = 7
//        dateComponents.day = 11
//        dateComponents.timeZone = TimeZone(abbreviation: "PST") // Pacific Standard Time
//        dateComponents.hour = 8
//        dateComponents.minute = 34
//        let userCalendar = Calendar.current // user calendar
//        let someDateTime = userCalendar.date(from: dateComponents)
        
        
        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
        newMatch.setValue("temp1", forKey: "homeTeam")
        newMatch.setValue("temp2", forKey: "awayTeam")
        newMatch.setValue("temp3", forKey: "location")
        newMatch.setValue("temp4", forKey: "date")
        newMatch.setValue("temp5", forKey: "halfTime")
        newMatch.setValue("temp6", forKey: "time");
        
        //where the data gets saved
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

