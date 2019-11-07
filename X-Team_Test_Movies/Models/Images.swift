//
//  Images.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation

class Images {
    var baseUrl: String?
    var secureBaseUrl: String?
    var posterSizes: Array<String>?
    
    init(baseUrl: String?, secureBaseUrl: String?, posterSizes: Array<String>?) {
        self.baseUrl = baseUrl
        self.secureBaseUrl = secureBaseUrl
        self.posterSizes = posterSizes
    }
}
