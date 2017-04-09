//
//  WeatherWeatherBuilder.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class WeatherBuilder {

    class func buildControllerForDefault() -> WeatherViewController {
        let controller = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
	
        let configurator = WeatherModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: controller)
    	
        return controller
    }

}
