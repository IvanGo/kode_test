//
//  Weather/WeatherPresenter.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

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
        (view as? UIViewController)?.navigationItem.titleView = buildHeader()
        
        weatherFetchingGroup.enter()
        interactor.fetchWeather(forCity: fromCity)
        
        weatherFetchingGroup.enter()
        interactor.fetchWeather(forCity: toCity)
        
        weatherFetchingGroup.notify(queue: .main) {
            self.view.display(from: self.weatherList[0], to: self.weatherList[1])
        }
    }
    
    private func buildHeader() -> UIView {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 90, height: 44))
        let image = UIImageView(frame: CGRect(x: 90, y: 11, width: 20, height: 20))
        let rightLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 90, height: 44))
        
        leftLabel.text = fromCity.name
        leftLabel.textAlignment = .center
        rightLabel.text = toCity.name
        rightLabel.textAlignment = .center
        image.image = #imageLiteral(resourceName: "iconPlane")
        
        image.tintColor = .white
        leftLabel.textColor = .white
        rightLabel.textColor = .white
        
        container.addSubview(leftLabel)
        container.addSubview(image)
        container.addSubview(rightLabel)
        
        return container
    }
}
