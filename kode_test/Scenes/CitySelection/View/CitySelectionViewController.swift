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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dotImageView: UIImageView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var subtitleLabel: UILabel!

    fileprivate var cities = [City]()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(self.output != nil, "you must create new scene instance with it's router methods")
        
        containerView.backgroundColor = UIColor.kdMainBackground
        
        cityTextField.delegate = self
        
        citiesTableView.estimatedRowHeight = 61
        citiesTableView.rowHeight = UITableViewAutomaticDimension
        citiesTableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "cell")
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
	
        output.viewIsReady()
    }


    // MARK: CitySelectionViewInput
    func setupInitialState() {
    }
    
    func display(cities: [City]) {
        self.cities = cities
        citiesTableView.reloadSections([0], with: .top)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CitySelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output.handle(citySelected: cities[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}

extension CitySelectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CityCell
        cell.city = cities[indexPath.row]
        return cell
    }
}

extension CitySelectionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let nsString = textField.text as NSString? {
            let newString = nsString.replacingCharacters(in: range, with: string)
            output.handle(textChanged: newString)
        }
        
        return true
    }
}
