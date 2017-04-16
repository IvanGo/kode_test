//
//  WeatherCell.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 17/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(left: Weather, right: Weather) {
        dateLabel.text = left.dateString
        
        leftLabel.text  = left.temp + "℃"
        rightLabel.text = right.temp + "℃"
    }
    
}
