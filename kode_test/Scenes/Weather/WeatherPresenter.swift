//
//  Weather/WeatherPresenter.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import Foundation

class WeatherPresenter: WeatherModuleInput, WeatherViewOutput, WeatherInteractorOutput {

    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!
    
    var fromCity: City!
    var toCity: City!
    
    var weatherList: [[Weather]] = [[],[]]
    
    let weatherFetchingGroup = DispatchGroup()

    // link to global router
    weak var globalRouter: Router?
    
    func present(weather: [Weather], cityName: String) {
        if cityName == fromCity.name {
            weatherList[0] = weather
        } else {
            weatherList[1] = weather
        }
        weatherFetchingGroup.leave()
    }

    func viewIsReady() {
        weatherFetchingGroup.enter()
        interactor.fetchWeather(forCity: fromCity)
        
        weatherFetchingGroup.enter()
        interactor.fetchWeather(forCity: toCity)
        
        weatherFetchingGroup.notify(queue: .main) {
            self.view.display(from: self.weatherList[0], to: self.weatherList[1])
        }
    }
}
