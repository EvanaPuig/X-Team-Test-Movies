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
            
            let baseUrl = json[MovieAppConstants.configurationParserImagesKey][MovieAppConstants.configurationParserBaseUrlKey].stringValue
            let secureBaseUrl = json[MovieAppConstants.configurationParserImagesKey][MovieAppConstants.configurationParserSecureBaseUrlKey].stringValue
            let posterArray = json[MovieAppConstants.configurationParserImagesKey][MovieAppConstants.configurationParserPosterSizesKey].arrayValue
            
            for item in posterArray {
                posterSizes.append(item.stringValue)
            }
            
            let imageConfiguration = Images(baseUrl: baseUrl, secureBaseUrl: secureBaseUrl, posterSizes: posterSizes)
            
            return Configuration(images: imageConfiguration)
        } catch {
            print(MovieAppConstants.configurationParserError)
        }
        return Configuration(images: nil)
    }
}
