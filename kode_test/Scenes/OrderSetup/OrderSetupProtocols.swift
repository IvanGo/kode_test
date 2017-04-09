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

    func setupInitialState()
}

protocol OrderSetupViewOutput {

    /**
        @author Ivan Gorbulin
        Notify presenter that view is ready
    */

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