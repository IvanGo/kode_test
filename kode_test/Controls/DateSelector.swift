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
        addDateButton.isUserInteractionEnabled = false
        
        clearButton = initAndPlace(ofType: UIButton.self)
        clearButton.setTitle("X", for: .normal)
        clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        
        captionLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        captionLabel.font = UIFont.systemFont(ofSize: 11)
        
        dateLabel.textColor = UIColor.white
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showController))
        addGestureRecognizer(tapRecognizer)
    }
    
    func showController() {
        let controller = DateSelectorViewController()
        controller.sender = self
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: true, completion: nil)
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
            make.center.equalToSuperview().offset(4)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        clearButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
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
        clearButton.isHidden = !isClearable
    }
    
    func clear() {
        date = nil
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
    
    var sender: DateSelector? = nil
    
    let picker = UIDatePicker()
    let okButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        self.view.addGestureRecognizer(tapRecognizer)
        
        picker.minimumDate = Date()
        picker.datePickerMode = .date
        picker.backgroundColor = .white
        
        view.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
        
        okButton.setTitle("OK", for: .normal)
        okButton.addTarget(self, action: #selector(okPressed), for: .touchUpInside)
        view.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(picker.snp.top)
            make.right.equalToSuperview()
            make.width.equalTo(100)
        }
        
        picker.transform   = CGAffineTransform(translationX: 0, y: 250)
        okButton.transform = CGAffineTransform(translationX: 0, y: 250)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2) { 
            self.picker.transform = .identity
            self.okButton.transform = .identity
        }
    }
    
    func okPressed() {
        sender?.date = picker.date
        close()
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
}
