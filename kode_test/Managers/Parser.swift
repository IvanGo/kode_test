//
//  Parser.swift
//  kode_test
//
//  Created by Ivan Gorbulin on 09/04/2017.
//  Copyright © 2017 Ivan Gorbulin. All rights reserved.
//

import Foundation
import SwiftyJSON

class Parser {
    
    class func parse(citiesJson: JSON) -> [City] {
        
        var results = [City]()
        
        for (_, subjson) in citiesJson["results"] {
            if let name = subjson["city"].string {
                results.append(City(name: name))
            }
        }
        
        return results
    }
    
    class func parse(weatherJson: JSON) -> [Weather] {
        
        var results = [Weather]()
        
        for (_, subjson) in weatherJson["list"] {
            if let kelvin = subjson["main"]["temp"].float,
                let date = subjson["dt_txt"].string {
                results.append(Weather(temp: String(format: "%.2f", kelvin - 273.15), dateString: date))
            }
        }
        
        return results
    }
    
}
