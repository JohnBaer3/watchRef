//
//  ViewController.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 10/26/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBAction func buttonClick(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Match", in: context)
        
//        let newMatch = NSManagedObject(entity: entity!, insertInto: context)
//        newMatch.setValue("Real Madrid", forKey: "homeTeam")
//        newMatch.setValue("Real Madrid", forKey: "awayTeam")
//
//        //where the data gets saved
//        do {
//            try context.save()
//        } catch {
//            print("Failed saving")
//        }
        
        
        
        //this part is to fetch the data - one part of the code is to remove data, one is to print data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

