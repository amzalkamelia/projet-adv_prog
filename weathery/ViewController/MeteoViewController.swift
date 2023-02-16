//
//  MeteoViewController.swift
//  weathery
//
//  Created by Kamelia Amzal on 16/02/2023.
//

import UIKit

class MeteoViewController: UIViewController {
    
    @IBOutlet weak var selectPreferencesButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectPreferencesButtonView.layer.cornerRadius = 30
        selectPreferencesButtonView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToPreferences))
        gesture.numberOfTapsRequired = 1
        selectPreferencesButtonView?.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goToPreferences() {
        let prefView = self.storyboard?.instantiateViewController(withIdentifier: "PrefVC")
        self.navigationController?.pushViewController(prefView!, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
