//
//  ProgramTableViewCell.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit

//This is the class that makes the table view cells
class ProgramTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgSpeaker: UIImageView!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var halfTime: UILabel!
    
    
    //Save button is at the top of the table view cell, does nothing
    @IBAction func saveUnsaveSelection(sender: UIButton){
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
