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
    
    var idPreferences : String? //optionnel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        preferencesSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func switchChanged(_ sender : UISwitch) {
        let value = sender.isOn
        UserDefaults.standard.set(value, forKey: "\(idPreferences!)_switch")
        
        if idPreferences == "Temperature" && value == true{
            AlertManager.shared.checkTemperature()
        }
    }

}
