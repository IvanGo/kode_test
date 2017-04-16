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
    
    @IBOutlet weak var fromIconImageView: UIImageView!
    @IBOutlet weak var toIconImageView: UIImageView!
    @IBOutlet weak var lineImageView: UIImageView!
    
    @IBOutlet weak var fromDateSelector: DateSelector!
    @IBOutlet weak var toDateSelector: DateSelector!
    
    var fromCity: City? = nil {
        didSet {
            fromLabel.text = fromCity?.name ?? "Откуда"
        }
    }
    var toCity: City? = nil {
        didSet {
            toLabel.text = toCity?.name ?? "Куда"
        }
    }
    
    var output: OrderSetupViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(self.output != nil, "you must create new scene instance with it's router methods")
        
        navigationItem.title = "UTair"
        
        view.backgroundColor = UIColor.kdMainBackground
        
        fromIconImageView.tintColor = .white
        fromIconImageView.image = UIImage(named: "emptyDot")?.withRenderingMode(.alwaysTemplate)
        
        adultsStepper.value = 1
        adultsStepper.delegate = self
        kidsStepper.delegate = self
        babyStepper.delegate = self
        
        let fromTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapedOnFromCityLabel(_:)))
        fromLabel.addGestureRecognizer(fromTapRecognizer)
        fromLabel.isUserInteractionEnabled = true
        
        let toTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapedOnToCityLabel(_:)))
        toLabel.addGestureRecognizer(toTapRecognizer)
        toLabel.isUserInteractionEnabled = true
        
        fromDateSelector.isClearable = false
        fromDateSelector.date = Date()
        toDateSelector.date = nil
        toDateSelector.isClearable = true
        
        output.viewIsReady()
    }
    
    
    // MARK: OrderSetupViewInput
    func setupInitialState() {
    }
    
    //MARK: - TapGestureRecognizers
    func tapedOnFromCityLabel(_ sender: UITapGestureRecognizer) {
        output.handleTap(fromCity: nil)
    }
    
    func tapedOnToCityLabel(_ sender: UITapGestureRecognizer) {
        output.handleTap(toCity: nil)
    }
    
    @IBAction func swapCitiesButtonPressed(_ sender: Any) {
        let temp = fromCity
        fromCity = toCity
        toCity = temp
    }
    
    @IBAction func weatherButtonPressed(_ sender: Any) {
        if fromCity != nil && toCity != nil {
            output.handleFoundWeather(fromCity: fromCity!, toCity: toCity!)
        }
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
