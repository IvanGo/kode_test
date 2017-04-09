//
//  OrderSetupOrderSetupConfiguratorTests.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import XCTest

class OrderSetupModuleConfiguratorTests: XCTestCase {

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
        let viewController = OrderSetupViewControllerMock()
        let configurator = OrderSetupModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "OrderSetupViewController is nil after configuration")
        XCTAssertTrue(viewController.output is OrderSetupPresenter, "output is not OrderSetupPresenter")

        let presenter: OrderSetupPresenter = viewController.output as! OrderSetupPresenter
        XCTAssertNotNil(presenter.view, "view in OrderSetupPresenter is nil after configuration")

        let interactor: OrderSetupInteractor = presenter.interactor as! OrderSetupInteractor
        XCTAssertNotNil(interactor.output, "output in OrderSetupInteractor is nil after configuration")
    }

    class OrderSetupViewControllerMock: OrderSetupViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
