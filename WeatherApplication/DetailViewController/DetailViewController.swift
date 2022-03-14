//
//  DetailViewController.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 11/03/2022.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailViewModel: DetailViewModel?
    var detailWeatherView = DetailWeatherView()
    var weather: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailWeatherView()
    }
    
    func configure(viewModel: DetailViewModel) {
        self.detailViewModel = viewModel
    }

}

extension DetailViewController {
    
     private func addDetailWeatherView() {
        view.addSubview(detailWeatherView)

        detailWeatherView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configItems(for weather: WeatherModel) {
        detailWeatherView.cityNameLabel.text = weather.cityName
        detailWeatherView.weatherImageView.image = UIImage(systemName: weather.conditionName.0)
        detailWeatherView.backgroundColor = weather.conditionName.1
        detailWeatherView.temperatureLabel.text = weather.temperatureString
    }
    
}
