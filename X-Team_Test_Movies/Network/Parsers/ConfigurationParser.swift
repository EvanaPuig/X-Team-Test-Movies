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
    
    private var configuration: Configuration?
    
    func parse(data: Data) {
        do {
            let json = try JSON(data: data)
            print(json)
        } catch {
            print("error parsing json")
        }
    }
}
