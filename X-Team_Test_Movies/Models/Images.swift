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
    var backdropSizes: Array<String>?
    var logoSizes: Array<String>?
    var posterSizes: Array<String>?
    var profileSizes: Array<String>?
    var stillSizes: Array<String>?
    
    init(baseUrl: String?, secureBaseUrl: String?, backdropSizes: Array<String>?, logoSizes: Array<String>?, posterSizes: Array<String>?, profileSizes: Array<String>?, stillSizes: Array<String>?) {
        self.baseUrl = baseUrl
        self.secureBaseUrl = secureBaseUrl
        self.backdropSizes = backdropSizes
        self.logoSizes = logoSizes
        self.posterSizes = posterSizes
        self.profileSizes = profileSizes
        self.stillSizes = stillSizes
    }
}
