
  WeatherCellView.swift
  WeatherApplication

  Created by deniss.lobacs on 03/03/2022.


import Foundation
import UIKit
import SnapKit

class WeatherCellView: UIView {
    
    let horizontalStackView = UIStackView()
    let cityNameLabel = UILabel()
    let temperatureLabel = UILabel()
    let weatherImageView = UIImageView(image: UIImage(systemName: "cloud.rain"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addHorizontalStackView()
        addCityNameLabel()
        addTemperatureLabel()
        addWeatherImageView()
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension WeatherCellView {
    
    func addHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 20
        addSubview(horizontalStackView)
    }
    
    func addCityNameLabel() {
        cityNameLabel.textColor = .white
        cityNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cityNameLabel.text = "Toronto"
        horizontalStackView.addArrangedSubview(cityNameLabel)
    }
    
    func addTemperatureLabel() {
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 20)
        temperatureLabel.text = "16°"
        horizontalStackView.addArrangedSubview(temperatureLabel)
    }
    
    func addWeatherImageView() {
        weatherImageView.tintColor = .white
        horizontalStackView.addArrangedSubview(weatherImageView)
    }
    
    func setupConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(20)
        }
        
        cityNameLabel.snp.makeConstraints { make in
            make.right.equalTo(temperatureLabel).priority(250)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
    }
}
