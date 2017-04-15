//
//  OrderSetupOrderSetupProtocols.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

/*
 View layer 
 */

protocol OrderSetupViewInput: class {

    /**
        @author Ivan Gorbulin
        Setup initial state of the view
    */
    
    
    var fromCity: City? { get set }
    var toCity: City? { get set }

    func setupInitialState()
}

protocol OrderSetupViewOutput {

    /**
        @author Ivan Gorbulin
        Notify presenter that view is ready
    */
    
    func handleTap(fromCity: City?)
    func handleTap(toCity: City?)

    func viewIsReady()
}


/*
 Presenter layer 
 */
protocol OrderSetupModuleInput: class {
}



/*
 Interactor layer 
 */

protocol OrderSetupInteractorInput {
}

protocol OrderSetupInteractorOutput: class {

}
