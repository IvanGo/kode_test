//
//  WeatherWeatherBuilder.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class WeatherBuilder {

    class func buildController(fromCity: City, toCity: City) -> WeatherViewController {
        let controller = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
	
        let configurator = WeatherModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: controller, fromCity: fromCity, toCity: toCity)
    	
        return controller
    }

}
