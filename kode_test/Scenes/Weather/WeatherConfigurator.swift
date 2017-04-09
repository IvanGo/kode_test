//
//  Weather/WeatherConfigurator.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class WeatherModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? WeatherViewController {
            configure(viewController: viewController)
        }
    }

    //MARK: default config
    private func configure(viewController: WeatherViewController) {

        let presenter = WeatherPresenter()
        presenter.view = viewController

        let interactor = WeatherInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
 
        //-- bind dependencies --//
        presenter.globalRouter = Router.shared
   }
}
