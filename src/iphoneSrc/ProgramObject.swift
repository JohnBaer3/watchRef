//
//  ProgramObject.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit

class ProgramObject: NSObject, NSCoding {
    var homeName: String?
    var time: String?
    var date: String?
    var awayName: String?
    var halfTime: String?
    
    func initWithData(homeName: String, time: String, date: String, awayName: String, halfTime: String){
        self.homeName = homeName;
        self.time = time;
        self.date = date;
        self.awayName = awayName;
        self.halfTime = halfTime;
    }
    
    //used for deserializing the data ~ from the watch
    //use this data and share it between the watch and the phone
    required convenience init?(coder decoder: NSCoder){
        guard let homeName = decoder.decodeObject(forKey: "homeName") as? String,
            let time = decoder.decodeObject(forKey: "time") as? String,
            let date = decoder.decodeObject(forKey: "date") as? String,
            let awayName = decoder.decodeObject(forKey: "awayName") as? String,
            let halfTime = decoder.decodeObject(forKey: "halfTime") as? String
        else{
            return nil
        }
        
        self.init()
        self.initWithData(homeName: homeName, time: time, date: date, awayName: awayName, halfTime: halfTime)
    }
    
    
    //used for serializing and sending off data
    func encode(with coder: NSCoder){
        coder.encode(self.homeName, forKey: "homeName");
        coder.encode(self.time, forKey: "time");
        coder.encode(self.date, forKey: "date");
        coder.encode(self.awayName, forKey: "awayName");
        coder.encode(self.halfTime, forKey: "halfTime");
    }
    
    
}







