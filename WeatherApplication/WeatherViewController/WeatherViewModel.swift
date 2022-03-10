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
    
    func shouldUpdateTable() {
        self.onUpdateTable?()
    }
    
    func shouldGoToSearchViewController() {
        self.onGoToSearchViewController?()
    }
    
    func getValue(index: Int) -> WeatherModel? {
        return weatherManager.getValue(index: index)
    }
    
    func getTableItemsCount() -> Int? {
        return weatherManager.tableItems.count
    }
    
    
}
