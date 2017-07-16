//
//  Constants.swift
//  WeatherApp
//
//  Created by Vishnu on 7/8/17.
//  Copyright © 2017 Vishnu. All rights reserved.
//

import Foundation

let base_url = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longitude = "&lon="
let app_id = "&appid="
let api_key = "774c9f45e4e7649323d47a9afae3e140"
let current_weather_url = "\(base_url)\(latitude)13\(longitude)80\(app_id)\(api_key)"

typealias downloadComplete = () -> ()

let forecast_weather_url = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=13&lon=80&cnt=10&appid=774c9f45e4e7649323d47a9afae3e140"
