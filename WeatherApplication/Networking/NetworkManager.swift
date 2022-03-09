//
//  NetworkManager.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation

struct NetworkManager {
    
    static func fetchWeather(for cityName: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        let url = withCity(cityName)
        guard let url = url else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeatherData.self, from: data)
                let id = decodedData.weather[0].id
                let temp = decodedData.main.temp
                let name = decodedData.name
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                completion(.success(weather))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}



