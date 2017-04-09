//
//  CitySelectionCitySelectionBuilder.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class CitySelectionBuilder {

    class func buildControllerForDefault() -> CitySelectionViewController {
        let controller = CitySelectionViewController(nibName: "CitySelectionViewController", bundle: nil)
	
        let configurator = CitySelectionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: controller)
    	
        return controller
    }

}
