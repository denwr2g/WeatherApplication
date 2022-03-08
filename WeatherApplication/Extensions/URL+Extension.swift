//
//  Constants.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation


extension URL {
    static func withCity(_ city: String) -> URL? {
        URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=5cb0376968acd967cfb18269e92e59b2&units=metric&q=\(city)")
    }
}


