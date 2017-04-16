//
//  WeatherWeatherViewController.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 08/04/2017.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, WeatherViewInput {

    var output: WeatherViewOutput!
    
    @IBOutlet weak var weatherTable: UITableView!
    
    fileprivate var fromWeather = [Weather]()
    fileprivate var toWeather   = [Weather]()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(self.output != nil, "you must create new scene instance with it's router methods")
        
        weatherTable.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "cell")
        weatherTable.dataSource = self
        weatherTable.delegate = self
	
        output.viewIsReady()
    }


    // MARK: WeatherViewInput
    func setupInitialState() {
    }
    
    func display(from: [Weather], to: [Weather]) {
        fromWeather = from
        toWeather = to
        weatherTable.reloadSections([0], with: .automatic)
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(fromWeather.count, toWeather.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WeatherCell
        cell.bind(left: fromWeather[indexPath.row], right: toWeather[indexPath.row])
        return cell
    }
}
