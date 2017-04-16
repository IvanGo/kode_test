//
//  Router.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import UIKit

class Router {
    
    static let shared = Router()
    
    private(set) var root: UINavigationController
    
    init() {
        root = UINavigationController()
        root.navigationBar.isTranslucent = false
    }
    
    func start() {
        let mainController = OrderSetupBuilder.buildControllerForDefault()
        root.pushViewController(mainController, animated: false)
    }
    
    func showCitiesList(selectionClouse: @escaping CitySelectionDidSelect) {
        let citiesList = CitySelectionBuilder.buildControllerForDefault(selectionClouse: selectionClouse)
        citiesList.modalPresentationStyle = .overCurrentContext
        citiesList.modalTransitionStyle = .crossDissolve
        root.present(citiesList, animated: true, completion: nil)
    }
    
    func showWeather(from: City, to: City) {
        let weatherList = WeatherBuilder.buildController(fromCity: from, toCity: to)
        root.visibleViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        root.pushViewController(weatherList, animated: true)
    }
    
}
