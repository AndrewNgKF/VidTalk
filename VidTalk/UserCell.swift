//
//  UserCell.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit


class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCheckmark(false)

    }
    
    func updateUI(user: User) {
        
        firstNameLbl.text = user.firstName
        
        
    }

    func setCheckmark(selected: Bool) {
        
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image:  UIImage(named: imageStr))
        
    }

    
    
    
    
}
