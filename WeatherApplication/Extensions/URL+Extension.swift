//
//  Constants.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//
import Foundation

public func withCity(_ city: String) -> URL? {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.openweathermap.org"
    urlComponents.path = "/data/2.5/weather"
    
    urlComponents.queryItems = [
        URLQueryItem(name: "appid", value: "5cb0376968acd967cfb18269e92e59b2"),
        URLQueryItem(name: "units", value: "metric"),
        URLQueryItem(name: "q", value: city)
    ]
    
    return urlComponents.url
}


