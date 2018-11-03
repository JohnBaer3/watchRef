//
//  ProgramObject.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit

class ProgramObject: NSObject, NSCoding {
    var title: String?
    var speaker: String?
    var from: String?
    var to: String?
    var details: String?
    
    func initWithData(title: String, speaker: String, from: String, to: String, details: String){
        self.title = title;
        self.speaker = speaker;
        self.from = from;
        self.to = to;
        self.details = details;
    }
    
    //used for deserializing the data ~ from the watch
    //use this data and share it between the watch and the phone
    required convenience init?(coder decoder: NSCoder){
        guard let title = decoder.decodeObject(forKey: "title") as? String,
            let speaker = decoder.decodeObject(forKey: "speaker") as? String,
            let from = decoder.decodeObject(forKey: "from") as? String,
            let to = decoder.decodeObject(forKey: "to") as? String,
            let details = decoder.decodeObject(forKey: "details") as? String
        else{
            return nil
        }
        
        self.init()
        self.initWithData(title: title, speaker: speaker, from: from, to: to, details: details)
    }
    
    
    //used for serializing and sending off data
    func encode(with coder: NSCoder){
        coder.encode(self.title, forKey: "title");
        coder.encode(self.speaker, forKey: "speaker");
        coder.encode(self.from, forKey: "from");
        coder.encode(self.to, forKey: "to");
        coder.encode(self.details, forKey: "details");
    }
    
    
}







