//
//  Weather/WeatherInteractor.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class WeatherInteractor: WeatherInteractorInput {

    weak var output: WeatherInteractorOutput!

    func fetchWeather(forCity: City) {
        NetworkManager.requestWeather(cityName: forCity.name, succsed: { (weatherArray, city) in
            self.output.present(weather: weatherArray, cityName: city)
        }) { (_) in
            
        }
    }
}
