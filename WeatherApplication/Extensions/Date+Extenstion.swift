//
//  Date+Extenstion.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 11/03/2022.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
