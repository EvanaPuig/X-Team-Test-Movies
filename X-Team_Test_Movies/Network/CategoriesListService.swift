//  
//  PopularService.swift
//  X-Team_Test_movies
//
//  Created by Evana Margain on 3/11/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class CategoriesListService: CategoriesListServiceProtocol {
    
    private let movieParser = MovieParser()
    private let configurationParser = ConfigurationParser()
    private var movies: [Movie] = []
    private var configuration: Configuration?
    
    func getConfiguration(success: @escaping(_ data: Configuration?) -> (), failure: @escaping() -> ()) {
        
        let url = MovieAppConstants.configurationURL
        
        APIManager.request(
            url,
            method: .get,
            parameters: [MovieAppConstants.apiKey: MovieAppConstants.apiKeyValue],
            encoding: URLEncoding.default,
            headers: [MovieAppConstants.headerContentType: MovieAppConstants.headerContentTypeValue],
            completion: { data in
                self.configuration = self.configurationParser.parse(data: data)
                success(self.configuration)
        }) { errorMsg, errorCode in
            failure()
        }
    }
    
    func getPopularMovies(pageNumber: Int, success: @escaping(_ result: [Movie]) -> (), failure: @escaping() -> ()) {

        let url = MovieAppConstants.popularURL
            
        APIManager.request(
            url,
            method: .get,
            parameters: [MovieAppConstants.apiKey : MovieAppConstants.apiKeyValue, MovieAppConstants.parameterPage: pageNumber],
            encoding: URLEncoding.default,
            headers: [MovieAppConstants.headerContentType : MovieAppConstants.headerContentType],
            completion: { data in
                self.movies = self.movieParser.parse(data: data)
                success(self.movies)
            }) { errorMsg, errorCode in
                failure()
            }
    }
}
