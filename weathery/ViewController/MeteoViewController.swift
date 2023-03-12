//
//  MeteoViewController.swift
//  weathery
//
//  Created by Kamelia Amzal on 16/02/2023.
//
import UIKit
import Alamofire

class MeteoViewController: UIViewController {
    
    @IBOutlet weak var selectPreferencesButtonView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaperEiffelTower")!)
        selectPreferencesButtonView.layer.cornerRadius = 30
        selectPreferencesButtonView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToPreferences))
        gesture.numberOfTapsRequired = 1
        selectPreferencesButtonView?.addGestureRecognizer(gesture)
        
        setCurrentDate()
        
        getCurrentMeteo()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goToPreferences() {
        let prefView = self.storyboard?.instantiateViewController(withIdentifier: "PrefVC")
        self.navigationController?.pushViewController(prefView!, animated: true)
    }
    
    func setCurrentDate() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let currentDate = dateFormatter.string(from: Date())
        
        dateLabel.text = currentDate
    }
    
    func getCurrentMeteo() {
        let weatherApiURL = "http://api.weatherapi.com/v1/current.json?key=4bda37450da74c50a05192338231802&q=paris"
        
        AF.request(weatherApiURL).response{ response in  //async
            guard let data = response.data else {return} //optionnel
            // print(String(data: data, encoding: .utf8 ) ?? "Error in String conversion")
            
            do {
                let result = try JSONDecoder().decode(MeteoData.self, from: data)
                print(result)
                self.setCurrentMeteo(meteo: result)
            } catch { print(error) }
            
        }
    }
    
    func setCurrentMeteo(meteo : MeteoData){
        tempLabel.text = String(meteo.current.tempC)
        precipLabel.text = "Precipitation \(meteo.current.precipMm) mm"
        humidLabel.text = "Humidity \(meteo.current.humidity) %"
        windLabel.text = "Wind \(meteo.current.windKph) km/h"


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
