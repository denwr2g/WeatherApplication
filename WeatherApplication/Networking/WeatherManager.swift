//
//  NetworkManager.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation

class WeatherManager {
    
    static var shared = WeatherManager()
    
    private init(){}
    
    var url = Constants.weatherURL
    
    private func request(for city: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "\(url)&q=\(city)"
    
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            completion(.success(data))
            
            guard let error = error else { return }
            completion(.failure(error))
            
        }.resume()
    }
    
    func fetchWeather(for city: String, response: @escaping (WeatherModel?) -> Void) {
        request(for: city) { (result) in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                    let id = decodedData.weather[0].id
                    let temp = decodedData.main.temp
                    let name = decodedData.name
                    
                    let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                    response(weather)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
