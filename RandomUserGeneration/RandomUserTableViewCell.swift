//
//  RandomUserTableViewCell.swift
//  RandomUserGeneration
//
//  Created by Thaiveena Parthasarathy on 14/07/2019.
//  Copyright © 2019 Thaiveena Parthasarathy. All rights reserved.
//

import UIKit

class RandomUserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var UserImage: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    
    
    @IBOutlet weak var SubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected
        {
            backgroundColor = .orange
        }
        else{
            backgroundColor = .white
        }
    }
    
    
}
