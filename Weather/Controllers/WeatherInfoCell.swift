//
//  WeatherInfoCell.swift
//  Weather
//
//  Created by Anuradha Sharma on 11/26/18.
//  Copyright © 2018 Anuradha Sharma. All rights reserved.
//

import UIKit

class WeatherInfoCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
