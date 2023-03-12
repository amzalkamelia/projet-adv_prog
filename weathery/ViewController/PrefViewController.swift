//
//  PrefViewController.swift
//  weathery
//
//  Created by Kamelia Amzal on 16/02/2023.
//

import UIKit

class PrefViewController: UIViewController {
    
    let preferencesName = [
        "Temperature","Precipitation","Humidity","Wind speed","Natural disasters"]
    @IBOutlet weak var preferencesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        preferencesTableView.delegate = self
        preferencesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension PrefViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "preferencesCell", for: indexPath) as! PreferencesTableViewCell
        cell.titleLabel.text = preferencesName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prefView = self.storyboard?.instantiateViewController(withIdentifier: "settingsPreferenceVC") as! SettingsPreferenceViewController
        prefView.idPref = preferencesName[indexPath.row]
        self.present(prefView, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
