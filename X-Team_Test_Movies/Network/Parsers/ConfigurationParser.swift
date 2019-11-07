//
//  ConfigurationParser.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 06/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation
import SwiftyJSON

class ConfigurationParser {
    
    var posterSizes: [String] = []
    
    func parse(data: Data) -> Configuration {
        do {
            let json = try JSON(data: data)
            
            let baseUrl = json["images"]["base_url"].stringValue
            let secureBaseUrl = json["images"]["secure_base_url"].stringValue
            let posterArray = json["images"]["poster_sizes"].arrayValue
            
            for item in posterArray {
                posterSizes.append(item.stringValue)
            }
            
            let imageConfiguration = Images(baseUrl: baseUrl, secureBaseUrl: secureBaseUrl, posterSizes: posterSizes)
            
            return Configuration(images: imageConfiguration)
        } catch {
            print("error parsing json")
        }
        return Configuration(images: nil)
    }
}
