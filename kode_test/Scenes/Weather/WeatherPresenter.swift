//
//  Weather/WeatherPresenter.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class WeatherPresenter: WeatherModuleInput, WeatherViewOutput, WeatherInteractorOutput {

    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!

    // link to global router
    weak var globalRouter: Router?

    func viewIsReady() {

    }
}
