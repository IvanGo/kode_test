//
//  PassengerStepper.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 09/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import UIKit
import SnapKit

protocol PassengerStepperDelegate: class {
    func passengerStepper(_ stepper: PassengerStepper, shouldChange from: Int, to: Int) -> Bool
    func passengerStepper(_ stepper: PassengerStepper, didChange to: Int)
}

@IBDesignable
class PassengerStepper: UIView {
    
    @IBInspectable var icon: UIImage? = nil {
        didSet {
            iconImage.image = icon
        }
    }
    
    @IBInspectable var caption: String = "" {
        didSet {
            descriptionLabel.text = caption
        }
    }
    
    var value: Int = 0 {
        didSet {
            delegate?.passengerStepper(self, didChange: value)
            countLabel.text = "\(value)"

            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .autoreverse,
                           animations: { 
                            self.countLabel.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            }) { (_) in
                self.countLabel.transform = CGAffineTransform.identity
            }
        }
    }
    
    weak var delegate: PassengerStepperDelegate? = nil
    
    var plusButton: UIButton!
    var minusButton: UIButton!
    
    var countLabel: UILabel!
    var descriptionLabel: UILabel!
    
    var iconImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initAndSetupViews()
        placeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initAndSetupViews()
        placeViews()
    }
    
    private func initAndSetupViews() {
        #if !TARGET_INTERFACE_BUILDER
            translatesAutoresizingMaskIntoConstraints = false
        #endif
        
        plusButton  = initAndPlace(ofType: UIButton.self)
        minusButton = initAndPlace(ofType: UIButton.self)
        countLabel  = initAndPlace(ofType: UILabel.self)
        descriptionLabel = initAndPlace(ofType: UILabel.self)
        iconImage = initAndPlace(ofType: UIImageView.self)
        
        iconImage.tintColor = .white
        
        countLabel.text = "0"
        countLabel.font = UIFont.systemFont(ofSize: 18)
        countLabel.textColor = .white
        
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.contentHorizontalAlignment = .left
        plusButton.tintColor = .white
        plusButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.contentHorizontalAlignment = .left
        minusButton.tintColor = .white
        minusButton.addTarget(self, action: #selector(minusButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func placeViews() {
        plusButton.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        
        minusButton.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalTo(descriptionLabel.snp.top)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(minusButton.snp.top).offset(-8)
            make.left.right.equalToSuperview()
        }
        
        iconImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-4)
            make.left.equalTo(countLabel.snp.right).offset(4)
        }
    }

    private func initAndPlace<T>( ofType: T.Type) -> T where T: UIView {
        let result = T(frame: .zero)
        #if !TARGET_INTERFACE_BUILDER
            result.translatesAutoresizingMaskIntoConstraints = false
        #endif
        addSubview(result)
        
        return result
    }
    
    // MARK: - Buttons
    func plusButtonPressed(_ sender: UIButton) {
        if delegate == nil || delegate!.passengerStepper(self, shouldChange: value, to: value + 1) {
            value += 1
        }
    }
    
    func minusButtonPressed(_ sender: UIButton) {
        if delegate == nil || delegate!.passengerStepper(self, shouldChange: value, to: value - 1) {
            value -= 1
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
