//
//  NetworkManager.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 09/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias NetworkManagerSuccessCities = ([City]) -> Void
typealias NetworkManagerSuccessWeather = ([Weather], String) -> Void
typealias NetworkManagerFail = (Error) -> Void

class NetworkManager {
    
    private static let cityURL = "http://api.meetup.com/2/cities"
    private static let weatherURL = "http://api.openweathermap.org/data/2.5/forecast?q=%@&appid=1162ddaf76277f480a9d6ba1466274eb"

    class func requestCities(succsed: @escaping NetworkManagerSuccessCities, fail: @escaping NetworkManagerFail) {
        Alamofire.request(URL(string: cityURL)!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
            switch(response.result) {
            case .success(let value):
                let json = JSON(value)
                let cities = Parser.parse(citiesJson: json)
                succsed(cities)
                break
            case .failure(let error):
                print("\(error)")
                fail(error)
                break
            }
            
        }
    }
    
    class func requestWeather(cityName: String, succsed: @escaping NetworkManagerSuccessWeather, fail: @escaping NetworkManagerFail) {
        let url = String(format: weatherURL, cityName)
        Alamofire.request(URL(string: url)!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
            switch(response.result) {
            case .success(let value):
                let json = JSON(value)
                let weather = Parser.parse(weatherJson: json)
                succsed(weather, cityName)
                break
            case .failure(let error):
                print("\(error)")
                fail(error)
                break
            }
            
        }
    }

}
