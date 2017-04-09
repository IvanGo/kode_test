//
//  OrderSetup/OrderSetupPresenter.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

class OrderSetupPresenter: OrderSetupModuleInput, OrderSetupViewOutput, OrderSetupInteractorOutput {

    weak var view: OrderSetupViewInput!
    var interactor: OrderSetupInteractorInput!

    // link to global router
    weak var globalRouter: Router?

    func viewIsReady() {

    }
    
    func handleTap(toCity: City?) {
        Router.shared.showCitiesList { (city) in
            
        }
    }
    
    func handleTap(fromCity: City?) {
        Router.shared.showCitiesList { (city) in
            
        }
    }
}
