//
//  MovieParser.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 06/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieParser {
    
    private var movies: [Movie] = []
    
    func parse(data: Data) -> [Movie] {
        do {
            let json = try JSON(data: data)
            
            for item in json[MovieAppConstants.movieParserResultsKey].arrayValue {
                let movie = Movie(title: item[MovieAppConstants.movieParserTitleKey].stringValue, rating: item[MovieAppConstants.movieParserRatingKey].int, posterPath: item[MovieAppConstants.movieParserPosterPathKey].stringValue, overview: item[MovieAppConstants.movieParserOverviewKey].stringValue, releaseDate: item[MovieAppConstants.movieParserReleaseDateKey].stringValue, imageFormattedUrl: nil)
                
                movies.append(movie)
            }
        } catch {
            print(MovieAppConstants.movieParserError)
        }        
        return movies
    }
}
