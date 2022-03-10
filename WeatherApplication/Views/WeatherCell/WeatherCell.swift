//
//  WeatherCell.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 03/03/2022.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configCell(_ weather: WeatherModel) {
        self.cityNameLabel.text = weather.cityName
        self.temperatureLabel.text = weather.temperatureString
        self.weatherImageView.image = UIImage(systemName: weather.conditionName)
    }
}
