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
  func getPopularMovies(pageNumber: Int, success: @escaping(_ result: Data) -> (), failure: @escaping() -> ()) {

        let url = MovieAppConstants.popularURL
            
        APIManager.request(
            url,
            method: .get,
            parameters: [MovieAppConstants.apiKey : MovieAppConstants.apiKeyValue, MovieAppConstants.parameterPage: pageNumber],
            encoding: URLEncoding.default,
            headers: [MovieAppConstants.headerContentType : MovieAppConstants.headerContentType],
            completion: { data in
                // mapping data
                print(data)
                success(data)
            }) { errorMsg, errorCode in
                failure()
            }
    }
}
