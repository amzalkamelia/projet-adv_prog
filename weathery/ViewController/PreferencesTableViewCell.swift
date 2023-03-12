//
//  PreferencesTableViewCell.swift
//  weathery
//
//  Created by Kamelia Amzal on 11/03/2023.
//

import UIKit

class PreferencesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var preferencesSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
