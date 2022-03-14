//
//  WeatherViewModel.swift
//  WeatherApplication
//
//  Created by deniss.lobacs on 04/03/2022.
//

import Foundation
import UIKit

final class WeatherViewModel {
    
    private let weatherManager = WeatherManager.shared
    
    var onUpdateTable: (() -> Void)?
    var onGoToSearchViewController: (() -> Void)?
    var onGoToDetailViewController: ((WeatherModel) -> Void)?

    func shouldUpdateTable() {
        self.onUpdateTable?()
    }
    
    func shouldGoToSearchViewController() {
        self.onGoToSearchViewController?()
    }
    
    func shouldGoToDetailViewController(with weatherModel: WeatherModel) {
        self.onGoToDetailViewController?(weatherModel)
    }
    
    func getValue(index: Int) -> WeatherModel? {
        return weatherManager.getValue(index: index)
    }
    
    func getTableItemsCount() -> Int? {
        return weatherManager.tableItems.count
    }
    
    func removeCell(index: Int) {
        Weather.model.remove(at: index)
        WeatherManager.shared.tableItems.remove(at: index)
    }
    
}
