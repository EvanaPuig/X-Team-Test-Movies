//  
//  PopularViewModel.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import Foundation

class CategoriesListViewModel {
    private let service: CategoriesListServiceProtocol
    
    var movies: [Movie] = [Movie]()

    var formattedUrls = [String]()
    var configuration: Configuration?
    
    //Define selected model
    var selectedMovie: Movie?
    var selectedMovieUrl: String?

    private var cellViewModels: [CategoriesCustomCellViewModel] = [CategoriesCustomCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }

    /// Count your data in model
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    //MARK: -- Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = MovieAppConstants.networkUnavailableError
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    //MARK: -- Closure Collection
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init(withPopular serviceProtocol: CategoriesListServiceProtocol = CategoriesListService()) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }

    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    func fetchConfiguration(caller: String) {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            self.isLoading = true
            self.service.getConfiguration(success: { data in
                
                self.fetchPopularMovies(pageNumber: 1)
                self.isLoading = false
            }) {
                print("error")
                self.isLoading = false
            }
        default:
            break
        }
    }

    func fetchPopularMovies(pageNumber: Int) {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            self.isLoading = true
            
            self.service.getPopularMovies(pageNumber: pageNumber, success: { data in
                //self.processFetchedMovie(movies: self.movies)
                self.isLoading = false
            }) {
                print("error")
                self.isLoading = false
            }
        default:
            break
        }
    }
    
    
    
    func getCellViewModel( at indexPath: IndexPath ) -> CategoriesCustomCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( movie: Movie ) -> CategoriesCustomCellViewModel {
        
        let baseUrl = configuration?.images?.secureBaseUrl
        let imageSize = configuration?.images?.posterSizes?[4]
        let posterPath = movie.posterPath
        
        let formattedURL = (baseUrl ?? "") + (imageSize ?? "") + (posterPath ?? "")
        formattedUrls.append(formattedURL)
        movie.imageFormattedUrl = formattedURL
        
        return CategoriesCustomCellViewModel( titleText: movie.title ?? MovieAppConstants.movieNoTitle,
                                              popularityText: (movie.rating?.description ?? "0") + "/10" ,
                                         imageUrl: formattedURL)
    }
}

extension CategoriesListViewModel {
    func userPressed( at indexPath: IndexPath ) -> Movie{
        let movie = self.movies[indexPath.row]
        let imageUrl = self.formattedUrls[indexPath.row]
        self.selectedMovie = movie
        self.selectedMovieUrl = imageUrl
        return movie
    }
}
