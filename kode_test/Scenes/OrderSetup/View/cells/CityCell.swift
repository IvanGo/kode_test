//
//  CityCell.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 15/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var city: City? {
        didSet {
            nameLabel.text = city?.name
            descriptionLabel.text = "Все аэропорты"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            nameLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        } else {
            nameLabel.textColor = UIColor.white
        }
    }
    
}
