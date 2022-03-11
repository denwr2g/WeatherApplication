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
        print(Weather.model)
    }
    
    // MARK: - WeatherViewController Methods
    
    public func updateTableViewContent() {
        tableView.reloadData()
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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    // MARK: - WeatherViewController Setup
    
    func configNavigationItems() {
        navigationItem.title = "Weather App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToSearchViewController))
    }
    
    @objc func goToSearchViewController() {
        viewModel?.shouldGoToSearchViewController()  
    }
    
}

// MARK: - WeatherViewController DataSource

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel?.getTableItemsCount() else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell,
              let weather = viewModel?.getValue(index: indexPath.row) else { return .init() }
        
        cell.configCell(weather)
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
        guard let weather = viewModel?.getValue(index: indexPath.row) else { return }

        viewModel?.shouldGoToDetailViewController(with: weather)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            viewModel?.removeCell(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
}
