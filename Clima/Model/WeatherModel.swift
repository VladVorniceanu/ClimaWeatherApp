//
//  WeatherModel.swift
//  Clima
//
//  Created by Vlad Vorniceanu on 23.02.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionId:Int
    let cityName: String
    let temperature: Double
    
    var temperatureString:String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName:String {
        switch conditionId {
        case 200 ... 232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...504:
            return "cloud.rain"
        case 511:
            return "cloud.sleet"
        case 520...531:
            return "cloud.drizzle"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "wind"
        case 801:
            return "cloud.sun"
        case 802:
            return "cloud"
        case 803...804:
            return "smoke"
        default:
            return "sun.max"
        }
    }
}
