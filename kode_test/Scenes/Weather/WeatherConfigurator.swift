//
//  Weather/WeatherConfigurator.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class WeatherModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, fromCity: City, toCity: City) {

        if let viewController = viewInput as? WeatherViewController {
            configure(viewController: viewController, fromCity: fromCity, toCity: toCity)
        }
    }

    //MARK: default config
    private func configure(viewController: WeatherViewController, fromCity: City, toCity: City) {

        let presenter = WeatherPresenter()
        presenter.view = viewController
        presenter.fromCity = fromCity
        presenter.toCity = toCity

        let interactor = WeatherInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
 
        //-- bind dependencies --//
        presenter.globalRouter = Router.shared
   }
}
