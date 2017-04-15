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
typealias NetworkManagerFail = (Error) -> Void

class NetworkManager {
    
    private static let cityURL = "http://api.meetup.com/2/cities"

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

}
