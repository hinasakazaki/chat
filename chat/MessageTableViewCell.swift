//
//  MessageTableViewCell.swift
//  chat
//
//  Created by Hina Sakazaki on 9/30/15.
//  Copyright © 2015 Hina Sakazaki. All rights reserved.
//

import UIKit
import Parse

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageLabel: UILabel!
    
    var message : PFObject! {
        didSet{
            print (message)
          messageLabel.text = message["text"] as? String
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
