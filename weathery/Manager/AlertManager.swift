//
//  AlertManager.swift
//  weathery
//
//  Created by Kamelia Amzal on 20/03/2023.
//

import Foundation
import NotificationCenter

class AlertManager {
    static var shared = AlertManager()
    var temperature : Double?
    
    func checkTemperature() {
        guard let temperature = temperature else {return}
        let minValue = Double(UserDefaults.standard.integer(forKey: "Temperaturemin"))
        let maxValue = Double(UserDefaults.standard.integer(forKey: "Temperaturemax"))
        
        if temperature < minValue {
            sendNotificationTemperature(isMaximum: false)
        } else if temperature > maxValue {
            sendNotificationTemperature(isMaximum: true)
        }
    }
    
    func sendNotificationTemperature(isMaximum : Bool) {
                let content = UNMutableNotificationContent()
                content.title = "Alerte Temperature \(isMaximum == true ? "Max" : "Min")"
                content.body = "La temparature est à \(temperature!) °C"
                let request = UNNotificationRequest(identifier: "temperatureAlerte", content: content, trigger: nil)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
}
