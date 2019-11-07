//
//  CategoriesListServiceProtocol.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 06/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation

protocol CategoriesListServiceProtocol {

    /// - Parameters:
    ///   - success: -- success closure response, add your Model on this closure.
    ///                 example: success(_ data: YourModelName) -> ()
    ///   - failure: -- failure closure response, add your Model on this closure.
    ///                 example: success(_ data: APIError) -> ()
    func getConfiguration(success: @escaping(_ data: Configuration) -> (), failure: @escaping() -> ())
    func getPopularMovies(pageNumber: Int, success: @escaping(_ data: [Movie]) -> (), failure: @escaping() -> ())

}
