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
    private var viewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        configNavigationItems()
    }
    
// MARK: - WeatherViewController Methods

    public func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configure(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
    }
    
}

// MARK: - WeatherViewController Table Setup

private extension WeatherViewController {
    func configTable() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBlue

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: Constants.weatherNibName, bundle: nil), forCellReuseIdentifier: Constants.weatherCell)
    }
    
// MARK: - WeatherViewController Setup

    func configNavigationItems() {
        navigationItem.title = "Weather App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
    }
        
    @objc func addCity() {
        presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [weak self] city in
            guard let self = self else {return}
            self.viewModel?.fetchWeather(for: city)
        }
    }
}

// MARK: - WeatherViewController DataSource

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel?.getTableItemsCount() else { return 0 } 
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.weatherCell, for: indexPath) as? WeatherCell,
              let weather = viewModel?.getValue(index: indexPath.row) else { return UITableViewCell.init() }
        
        cell.set(weather)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - WeatherViewController Delegates

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
