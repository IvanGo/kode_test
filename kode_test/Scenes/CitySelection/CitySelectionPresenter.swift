//
//  CitySelection/CitySelectionPresenter.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class CitySelectionPresenter: CitySelectionModuleInput, CitySelectionViewOutput, CitySelectionInteractorOutput {

    var selectionClouse: CitySelectionDidSelect?
    
    weak var view: CitySelectionViewInput!
    var interactor: CitySelectionInteractorInput!

    // link to global router
    weak var globalRouter: Router?

    func viewIsReady() {
        interactor.fetchCities()
    }
}
