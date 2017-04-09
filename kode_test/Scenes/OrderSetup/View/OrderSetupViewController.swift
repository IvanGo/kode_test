//
//  OrderSetupOrderSetupViewController.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class OrderSetupViewController: UIViewController, OrderSetupViewInput {
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var fromDescriptionLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var toDescriptionLabel: UILabel!
    
    @IBOutlet weak var adultsStepper: PassengerStepper!
    @IBOutlet weak var kidsStepper: PassengerStepper!
    @IBOutlet weak var babyStepper: PassengerStepper!
    
    
    var output: OrderSetupViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(self.output != nil, "you must create new scene instance with it's router methods")
        
        view.backgroundColor = UIColor.kdMainBackground
        
        adultsStepper.value = 1
        adultsStepper.delegate = self
        kidsStepper.delegate = self
        babyStepper.delegate = self
        
        output.viewIsReady()
    }
    
    
    // MARK: OrderSetupViewInput
    func setupInitialState() {
    }
}

extension OrderSetupViewController: PassengerStepperDelegate {
    
    func passengerStepper(_ stepper: PassengerStepper, shouldChange from: Int, to: Int) -> Bool {
        
        return isValidChange(stepper: stepper,value: from, to: to)
    }
    
    func passengerStepper(_ stepper: PassengerStepper, didChange to: Int) {
        
    }
    
    private func isValidChange(stepper: PassengerStepper, value: Int, to: Int) -> Bool {
        
        //не допускаем значение меньшн ноля
        if to < 0 {
            return false
        }
        
        //
        if to > value && adultsStepper.value + kidsStepper.value + babyStepper.value == 9 {
            return false
        }
        
        if stepper === babyStepper {
            if to > adultsStepper.value {
                return false
            }
        }
        
        if stepper === adultsStepper {
            
            if to < 1 {
                return false
            }
            
            if to < babyStepper.value {
                babyStepper.value = to
            }
        }
        
        return true
    }
}