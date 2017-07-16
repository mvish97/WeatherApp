//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Vishnu on 7/9/17.
//  Copyright © 2017 Vishnu. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName:String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        return _date
    }
    
    func downloadWeatherDetails(completed: downloadComplete) {
        
        let currentWeatherUrl = URL(string: current_weather_url)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let city = dict["name"] as? String { // Extracting the city name from the JSON obj
                    self._cityName = city.capitalized
                    print(self.cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] { // Extracting the weather type from the JSON obj
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self.weatherType)
                    }
                }
             
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemp = main["temp"] as? Double {
                        
                        let kf = (currentTemp * (9/5) - 459.67)
                        
                        let kf2 = Double(round(10 * kf/10))
                        
                        self._currentTemp = kf2
                        print(self.currentTemp)
                    }
                }
            }
        }
        completed()
    }
}
