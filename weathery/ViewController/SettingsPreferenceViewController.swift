//
//  SettingsPreferenceViewController.swift
//  weathery
//
//  Created by Kamelia Amzal on 11/03/2023.
//

import UIKit

class SettingsPreferenceViewController: UIViewController {

    @IBOutlet weak var minimumValueStepper: UIStepper!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueStepper: UIStepper!
    @IBOutlet weak var maximumValueLabel: UILabel!
    var idPref : String!
    var stepperMinValue : Double = 0
    var stepperMaxValue : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperMinValue = getValueMin()
        stepperMaxValue = getValueMax()
        minimumValueLabel.text = "\(Int(stepperMinValue))"
        maximumValueLabel.text = "\(Int(stepperMaxValue))"
        minimumValueStepper.value = stepperMinValue
        maximumValueStepper.value = stepperMaxValue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func minimumStepperValueChange(_ sender: Any) {
        let stepper = sender as! UIStepper
        if stepper.value < stepperMinValue {
            let value = Int(minimumValueLabel.text!)! - 1
            minimumValueLabel.text = "\(value)"
        } else {
            let value = Int(minimumValueLabel.text!)! + 1
            minimumValueLabel.text = "\(value)"
        }
        stepperMinValue = stepper.value
    }
    
    @IBAction func maximumStepperValueChange(_ sender: Any) {
        let stepper = sender as! UIStepper
        if stepper.value < stepperMaxValue {
            let value = Int(maximumValueLabel.text!)! - 1
            maximumValueLabel.text = "\(value)"
        } else {
            let value = Int(maximumValueLabel.text!)! + 1
            maximumValueLabel.text = "\(value)"
        }
        stepperMinValue = stepper.value
    }
    
    func getValueMin() -> Double {
        let value = UserDefaults.standard.integer(forKey: idPref+"min")
        return Double(value)
    }
    
    func getValueMax() -> Double {
        let value = UserDefaults.standard.integer(forKey: idPref+"max")
        return Double(value)
    }
    
    @IBAction func savePreferences(_ sender: Any) {
        let minVal = Int(minimumValueLabel.text!)!
        let maxVal = Int(maximumValueLabel.text!)!
        
        UserDefaults.standard.set(minVal, forKey: idPref+"min")
        UserDefaults.standard.set(maxVal, forKey: idPref+"max")
        
        print(minVal)
        print(maxVal)
        
        self.dismiss(animated: true)
    }


}
