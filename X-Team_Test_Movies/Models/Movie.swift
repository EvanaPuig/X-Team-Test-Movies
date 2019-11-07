//
//  Movie.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 06/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation

class Movie {
    
    // MARK: Properties
    var title: String?
    var rating: Int? //vote_average
    var posterPath: String?
    var overview: String?
    var releaseDate: String?
    var imageFormattedUrl: String?
    
    // MARK: Initializer
    init(title: String?, rating: Int?, posterPath: String?, overview: String?, releaseDate: String?, imageFormattedUrl: String?) {
        self.title = title
        self.rating = rating
        self.posterPath = posterPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.imageFormattedUrl = imageFormattedUrl
    }
}
