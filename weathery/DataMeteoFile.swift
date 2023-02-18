//
//  DataMeteoFile.swift
//  weathery
//
//  Created by Kamelia Amzal on 18/02/2023.
//

import Foundation

// MARK: - Welcome
struct MeteoData: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current  //datatype
struct Current: Codable {
    let lastUpdatedEpoch: Float
    let lastUpdated: String
    let tempC: Float
    let tempF: Double
    let isDay: Float
    let condition: Condition
    let windMph: Double
    let windKph, windDegree: Float
    let windDir: String
    let pressureMB: Float
    let pressureIn: Double
    let precipMm, precipIn, humidity, cloud: Float
    let feelslikeC, feelslikeF: Double
    let visKM, visMiles, uv, gustMph: Float
    let gustKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String
    let code: Float
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Float
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
