//
//  CitySelectionCitySelectionConfiguratorTests.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import XCTest

class CitySelectionModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = CitySelectionViewControllerMock()
        let configurator = CitySelectionModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CitySelectionViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CitySelectionPresenter, "output is not CitySelectionPresenter")

        let presenter: CitySelectionPresenter = viewController.output as! CitySelectionPresenter
        XCTAssertNotNil(presenter.view, "view in CitySelectionPresenter is nil after configuration")

        let interactor: CitySelectionInteractor = presenter.interactor as! CitySelectionInteractor
        XCTAssertNotNil(interactor.output, "output in CitySelectionInteractor is nil after configuration")
    }

    class CitySelectionViewControllerMock: CitySelectionViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
