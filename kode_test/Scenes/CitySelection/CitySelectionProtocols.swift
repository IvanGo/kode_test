//
//  CitySelectionCitySelectionProtocols.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

/*
 View layer 
 */

typealias CitySelectionDidSelect = (City) -> Void

protocol CitySelectionViewInput: class {

    /**
        @author Ivan Gorbulin
        Setup initial state of the view
    */

    func setupInitialState()
}

protocol CitySelectionViewOutput {

    /**
        @author Ivan Gorbulin
        Notify presenter that view is ready
    */

    func viewIsReady()
}


/*
 Presenter layer 
 */
protocol CitySelectionModuleInput: class {
}



/*
 Interactor layer 
 */

protocol CitySelectionInteractorInput {
    func fetchCities()
}

protocol CitySelectionInteractorOutput: class {

}
