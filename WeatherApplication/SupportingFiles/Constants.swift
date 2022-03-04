//
//  Constants.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation

struct Constants {
    static let apikey = "5cb0376968acd967cfb18269e92e59b2"
    static let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apikey)&units=metric"
    static let weatherCell = "weatherCell"
    static let weatherNibName = "WeatherCell"
}
