//
//  CitySelection/CitySelectionConfigurator.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class CitySelectionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CitySelectionViewController {
            configure(viewController: viewController)
        }
    }

    //MARK: default config
    private func configure(viewController: CitySelectionViewController) {

        let presenter = CitySelectionPresenter()
        presenter.view = viewController

        let interactor = CitySelectionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
 
        //-- bind dependencies --//
        presenter.globalRouter = Router.shared
   }
}
