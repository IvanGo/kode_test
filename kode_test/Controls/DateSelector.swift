//
//  DateSelector.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 16/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class DateSelector: UIView {
    
    var captionLabel: UILabel!
    var dateLabel: UILabel!
    
    var addDateButton: UIButton!
    var clearButton: UIButton!
    
    var isClearable = true
    
    var formatter: DateFormatter {
        get {
            let form = DateFormatter()
            form.dateFormat = "dd MMM, EE"
            return form
        }
    }
    
    @IBInspectable var date: Date? = nil {
        didSet {
            if date == nil {
                dateLabel.text = ""
                goEmptyState()
            } else {
                dateLabel.text = formatter.string(from: date!)
                goFillState()
            }
        }
    }
    
    @IBInspectable var caption: String = "" {
        didSet {
            captionLabel.text = caption
        }
    }

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
        
        captionLabel = initAndPlace(ofType: UILabel.self)
        dateLabel = initAndPlace(ofType: UILabel.self)
        
        addDateButton = initAndPlace(ofType: UIButton.self)
        addDateButton.setTitleColor(UIColor.white, for: .normal)
        addDateButton.setTitle("Добавить", for: .normal)
        addDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        addDateButton.layer.cornerRadius = 4
        addDateButton.layer.borderColor  = UIColor.white.cgColor
        addDateButton.layer.borderWidth  = 1
        
        clearButton = initAndPlace(ofType: UIButton.self)
        
        captionLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        captionLabel.font = UIFont.systemFont(ofSize: 11)
        
        dateLabel.textColor = UIColor.white
        dateLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func placeViews() {
        captionLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(8)
            make.top.equalTo(captionLabel.snp.bottom)
        }
        
        addDateButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    //MARK: - State logick
    private func goEmptyState() {
        addDateButton.isHidden = false
        captionLabel.isHidden = true
        dateLabel.isHidden = true
        clearButton.isHidden = true
    }
    
    private func goFillState() {
        addDateButton.isHidden = true
        captionLabel.isHidden = false
        dateLabel.isHidden = false
        clearButton.isHidden = isClearable
    }
    
    private func initAndPlace<T>( ofType: T.Type) -> T where T: UIView {
        let result = T(frame: .zero)
        #if !TARGET_INTERFACE_BUILDER
            result.translatesAutoresizingMaskIntoConstraints = false
        #endif
        addSubview(result)
        
        return result
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

class DateSelectorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        
    }
    
}
