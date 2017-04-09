//
//  Router.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import UIKit

class Router {
    
    static let shared = Router()
    
    private(set) var root: UINavigationController
    
    init() {
        root = UINavigationController()
        root.navigationBar.isTranslucent = false
        root.navigationBar.barTintColor = UIColor.kdMainBackground
    }
    
    func start() {
        let mainController = OrderSetupBuilder.buildControllerForDefault()
        root.pushViewController(mainController, animated: false)
    }
    
}