//
//  WeatherWeatherPresenterTests.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import XCTest

class WeatherPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: WeatherInteractorInput {

    }

    class MockViewController: WeatherViewInput {

        func setupInitialState() {

        }
    }
}
