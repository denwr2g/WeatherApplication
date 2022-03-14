//
//  DetailViewControllerView.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 11/03/2022.
//

import Foundation
import UIKit

class DetailWeatherView: UIView {
    
    let verticalStackView = UIStackView()
    let currentTimeLabel = UILabel()
    let cityNameLabel = UILabel()
    let weatherImageView = UIImageView()
    let temperatureLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addVerticalStackView()
        addCurrentTimeLabel()
        addCityNameLabel()
        addWeatherImageView()
        addTemperatureLabel()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

private extension DetailWeatherView {
    
    func addVerticalStackView() {
        verticalStackView.axis       = .vertical
        verticalStackView.alignment  = .center
        verticalStackView.spacing    = 30
        addSubview(verticalStackView)
    }
    
    func addCurrentTimeLabel() {
        cityNameLabel.font       = UIFont.systemFont(ofSize: 30, weight: .medium)
        currentTimeLabel.text    = Date().dayOfTheWeek()
        cityNameLabel.textColor  = .white
        verticalStackView.addArrangedSubview(currentTimeLabel)
    }
    
    
    func addCityNameLabel() {
        cityNameLabel.font       = UIFont.systemFont(ofSize: 40, weight: .medium)
        cityNameLabel.textColor  = .white
        verticalStackView.addArrangedSubview(cityNameLabel)
    }
    
    func addWeatherImageView() {
        weatherImageView.frame      = CGRect(x: 0, y: 0, width: 150, height: 120)
        weatherImageView.tintColor  = .white
        verticalStackView.addArrangedSubview(weatherImageView)
    }
    
    func addTemperatureLabel() {
        temperatureLabel.font       = UIFont.systemFont(ofSize: 80, weight: .thin)
        temperatureLabel.textColor  = .white
        verticalStackView.addArrangedSubview(temperatureLabel)
    }
    
    func setupConstraints() {
        
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.center.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(120)
        }
        
    }
    
}

