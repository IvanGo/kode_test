//
//  CitySelectionCitySelectionViewController.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class CitySelectionViewController: UIViewController, CitySelectionViewInput {

    var output: CitySelectionViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(self.output != nil, "you must create new scene instance with it's router methods")
	
        output.viewIsReady()
    }


    // MARK: CitySelectionViewInput
    func setupInitialState() {
    }
}
