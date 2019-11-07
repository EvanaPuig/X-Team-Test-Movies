//
//  Configuration.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation

class Configuration {
    // MARK: Properties
    var uniqueId: Int16?
    var images: Images?
    var changeKeys: Array<String>?
    
    // MARK: Initializer
    init(uniqueId: Int16?, images: Images?, changeKeys: Array<String>?) {
        self.uniqueId = uniqueId
        self.images = images
        self.changeKeys = changeKeys
    }
}


