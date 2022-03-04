//
//  ViewController.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 03/03/2022.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        configNavigationItems()
    }
    
}

// MARK: - WeatherViewController Setup

private extension WeatherViewController {
    func configTable() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBlue

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    func configNavigationItems() {
        navigationItem.title = "Weather App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
    }
    
    func printStr(str: String) {
        print(str)
    }
    
    @objc func addCity() {
        presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [weak self] city in
            guard let self = self else {return}
            self.printStr(str: city)
        }
    }
}

// MARK: - WeatherViewController DataSource and Delegates

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {return UITableViewCell.init()}
        
        cell.cityNameLabel.text = "Toronto"
        cell.temperatureLabel.text = "16°"
        
        cell.selectionStyle = .none
        return cell
    }
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
