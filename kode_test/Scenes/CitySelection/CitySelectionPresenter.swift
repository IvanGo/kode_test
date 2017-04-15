//
//  CitySelection/CitySelectionPresenter.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import Foundation

class CitySelectionPresenter: CitySelectionModuleInput, CitySelectionViewOutput, CitySelectionInteractorOutput {

    var selectionClouse: CitySelectionDidSelect?
    
    weak var view: CitySelectionViewInput!
    var interactor: CitySelectionInteractorInput!
    
    private var allCities = [City]()
    private var currentSearchText: String = "" {
        didSet {
            sendDisplay()
        }
    }
    
    private var retries: Int = 0

    // link to global router
    weak var globalRouter: Router?

    func viewIsReady() {
        interactor.fetchCities()
    }
    
    func handle(citySelected: City) {
        selectionClouse?(citySelected)
    }
    
    func handle(textChanged: String) {
        currentSearchText = textChanged
    }
    
    // MARK: - CitySelectionModuleInput
    func present(cities: [City]) {
        retries = 0
        allCities = cities
        sendDisplay()
    }
    
    func present(error: Error) {
        if retries < 6 {
            interactor.fetchCities()
        } else {
            present(cities: [])
        }
    }
    
    func sendDisplay() {
        let filteredSities = currentSearchText.isEmpty ? allCities : allCities.filter({ $0.name.lowercased().contains(currentSearchText.lowercased()) })
        DispatchQueue.main.async {
            self.view.display(cities: filteredSities)
        }
    }
    
}
