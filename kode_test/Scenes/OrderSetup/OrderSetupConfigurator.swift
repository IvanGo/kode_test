//
//  OrderSetup/OrderSetupConfigurator.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class OrderSetupModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? OrderSetupViewController {
            configure(viewController: viewController)
        }
    }

    //MARK: default config
    private func configure(viewController: OrderSetupViewController) {

        let presenter = OrderSetupPresenter()
        presenter.view = viewController

        let interactor = OrderSetupInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
 
        //-- bind dependencies --//
        presenter.globalRouter = Router.shared
   }
}
