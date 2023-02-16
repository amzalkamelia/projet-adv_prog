//
//  MainViewController.swift
//  weathery
//
//  Created by Kamelia Amzal on 16/02/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nextButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 50/2
        
        // Do any additional setup after loading the view.
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
