//
//  ProgramTableViewCell.swift
//  WatchConferenceConnectApp
//
//  Created by John Baer on 11/1/18.
//  Copyright © 2018 John Baer. All rights reserved.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var speaker: UILabel!
    @IBOutlet var imgSpeaker: UIImageView!
    @IBOutlet var from: UILabel!
    @IBOutlet var to: UILabel!
    
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
