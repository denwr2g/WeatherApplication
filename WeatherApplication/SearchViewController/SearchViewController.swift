//
//  SearchViewController.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 10/03/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchViewModel: SearchViewModel?
    var searchViewControllerView = SearchViewControllerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        searchViewControllerView.inputTextField.delegate = self
    }
    
    func configure(viewModel: SearchViewModel) {
        self.searchViewModel = viewModel
    }
}

private extension SearchViewController {
    
    func configureUI() {
        
        searchViewControllerView.searchButton.addTarget(self, action: #selector(addCity), for: .touchUpInside)
        
        view.addSubview(searchViewControllerView)
        searchViewControllerView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(5)
        }
    }
    
    @objc func addCity() {
        guard let cityName = self.searchViewControllerView.inputTextField.text else { return }
        self.searchViewControllerView.inputTextField.endEditing(true)
        self.searchViewModel?.fetchWeather(for: cityName)       
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchViewControllerView.inputTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchViewControllerView.inputTextField.text != "" {
            return true
        } else {
            searchViewControllerView.inputTextField.placeholder = "Type something"
            return false
        }
    }
}
