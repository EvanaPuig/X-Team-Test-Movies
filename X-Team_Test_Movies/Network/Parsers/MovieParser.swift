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
            
            for item in json["results"].arrayValue {
                let movie = Movie(title: item["title"].stringValue, rating: item["vote_average"].int, posterPath: item["poster_path"].stringValue, overview: item["overview"].stringValue, releaseDate: item["release_date"].stringValue, imageFormattedUrl: nil)
                
                movies.append(movie)
            }
        } catch {
            print("error parsing json")
        }        
        return movies
    }
}
