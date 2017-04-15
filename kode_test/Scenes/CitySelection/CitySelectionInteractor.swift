//
//  CitySelection/CitySelectionInteractor.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class CitySelectionInteractor: CitySelectionInteractorInput {

    weak var output: CitySelectionInteractorOutput!
    
    func fetchCities() {
        NetworkManager.requestCities(succsed: { (cities) in
            self.output.present(cities: cities)
        }) { (err) in
            self.output.present(error: err)
        }
    }

}
