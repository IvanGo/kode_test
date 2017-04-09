//
//  CitySelection/CitySelectionConfigurator.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class CitySelectionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, selectionClouse: @escaping CitySelectionDidSelect) {

        if let viewController = viewInput as? CitySelectionViewController {
            configure(viewController: viewController, selectionClouse: selectionClouse)
        }
    }

    //MARK: default config
    private func configure(viewController: CitySelectionViewController, selectionClouse: @escaping CitySelectionDidSelect) {

        let presenter = CitySelectionPresenter()
        presenter.view = viewController
        presenter.selectionClouse = selectionClouse

        let interactor = CitySelectionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
 
        //-- bind dependencies --//
        presenter.globalRouter = Router.shared
   }
}
