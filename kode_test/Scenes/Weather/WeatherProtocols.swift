//
//  WeatherWeatherProtocols.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

/*
 View layer 
 */

protocol WeatherViewInput: class {

    /**
        @author Ivan Gorbulin
        Setup initial state of the view
    */

    func setupInitialState()
}

protocol WeatherViewOutput {

    /**
        @author Ivan Gorbulin
        Notify presenter that view is ready
    */

    func viewIsReady()
}


/*
 Presenter layer 
 */
protocol WeatherModuleInput: class {
}



/*
 Interactor layer 
 */

protocol WeatherInteractorInput {
}

protocol WeatherInteractorOutput: class {

}