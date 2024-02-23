//
//  weatherManager.swift
//  Clima
//
//  Created by Vlad Vorniceanu on 23.02.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager:WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    var keys=Keys()
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&appid=\(keys.apiKey)&q=\(cityName)"
        performRequest(urlString)
    }
    
    func fetchWeather(_ lat: String,_ lon: String) {
        let urlString = "\(weatherURL)&appid=\(keys.apiKey)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString)
    }
    
    var delegate: WeatherManagerDelegate?
    
    func performRequest(_ urlString: String) {
        //        Step 1: create URL
        if let url = URL(string: urlString) {
            
            //        Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            //sesiunea face tot procesul de networking, ca un fel de browser
            
            //        Step 3: give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //        Step 4: start the task
            task.resume()
        }
    }
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName=decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
            
            return weather
        } catch {
            delegate?.didFailWithError(error)
            return nil;
        }
    }
}
