//
//  SearchViewControllerView.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 10/03/2022.
//

import Foundation
import UIKit

final class SearchWeatherView: UIView {
    
    let inputTextField = UITextField()
    let searchButton = UIButton(type: .system)
    var onButtonTap: ((String?) -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupItems()
        setupInputTextField()
        setupSearchButton()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func shouldButtonTapped(city: String?) {
        self.onButtonTap?(city)
    }
}

extension SearchWeatherView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if inputTextField.text != "" {
            return true
        } else {
            inputTextField.placeholder = "Type something"
            return false
        }
    }
}

private extension SearchWeatherView {
    
    func setupItems() {
        backgroundColor = .systemBlue
        inputTextField.delegate = self
    }
    
    func setupInputTextField() {
        addSubview(inputTextField)
        
        inputTextField.font = UIFont(name: "Arial", size: 14)
        inputTextField.textColor = .white
        inputTextField.layer.borderWidth = 1
        inputTextField.layer.cornerRadius = 10
        inputTextField.layer.borderColor = UIColor.white.cgColor
        inputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        inputTextField.textAlignment = .left
        inputTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter city name",
            attributes: [.foregroundColor : UIColor.white,
                         .font            : UIFont.systemFont(ofSize: 12)])
    }
    
    func setupSearchButton() {
        addSubview(searchButton)
        searchButton.backgroundColor = UIColor.white
        searchButton.layer.cornerRadius = 15
        searchButton.setTitle("Add", for: UIControl.State.normal)
        searchButton.tintColor = UIColor.systemBlue
        searchButton.addTarget(self, action: #selector(addCity), for: .touchUpInside)
    }
    
    func setupLayout() {
        inputTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(50)
            make.center.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(30)
            make.left.right.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func addCity() {
        guard let cityName = inputTextField.text else { return }
        inputTextField.endEditing(true)
        shouldButtonTapped(city: cityName)
    }
    
}
