//
//  SearchViewController.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 10/03/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchViewModel: SearchViewModel?
    var searchViewControllerView = SearchWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    func configure(viewModel: SearchViewModel) {
        self.searchViewModel = viewModel
    }
}

private extension SearchViewController {
    
    func configureItems() {
        searchViewControllerView.onButtonTap = { [weak self] city in 
            guard let self = self, let city = city else { return }
            self.searchViewModel?.fetchWeather(for: city)
        }
        
        view.addSubview(searchViewControllerView)
        searchViewControllerView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(5)
        }
    }
    
}


