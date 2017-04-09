//
//  OrderSetupOrderSetupBuilder.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class OrderSetupBuilder {

    class func buildControllerForDefault() -> OrderSetupViewController {
        let controller = OrderSetupViewController(nibName: "OrderSetupViewController", bundle: nil)
	
        let configurator = OrderSetupModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: controller)
    	
        return controller
    }

}
