//
//  HomeViewController.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let categoriesListService = CategoriesListService()
    lazy var viewModel: CategoriesListViewModel = {
        return CategoriesListViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init the static view
        initView()
        
        // init view model
        initViewModel()
    }
    
    func initView() {
        self.navigationItem.title = MovieAppConstants.popularTitle
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.register(CategoriesCustomCell.self, forCellReuseIdentifier: MovieAppConstants.genericCellIdentifier)
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        definesPresentationContext = true
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        UIView.animate(withDuration: 0.2, animations: {
           self.tableView.alpha = 0.0
        })
    }
    
    func initViewModel() {
        
        viewModel.fetchConfiguration(success: { 
            print("success")
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            UIView.animate(withDuration: 0.2, animations: {
                self.tableView.alpha = 1.0
            })
            for movie in self.viewModel.movies {
                self.viewModel.createCellViewModel(movie: movie)
            }
            self.tableView.reloadData()
            
        }) {
            print("failure")
        }
        
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( message )
                }
            }
        }
    }
    
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: MovieAppConstants.genericAlertTitle, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: MovieAppConstants.genericConfirmButton, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        do {
               try Auth.auth().signOut()
           }
            catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let initial = storyboard.instantiateInitialViewController()
           UIApplication.shared.keyWindow?.rootViewController = initial
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieAppConstants.genericCellIdentifier, for: indexPath) as! CategoriesCustomCell
        
        
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        cell.movieListCellViewModel = cellVM
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedMovie = self.viewModel.userPressed(at: indexPath)
        
        print("Movie selected: \(String(describing: selectedMovie.title))")
        
        /*
        let popularDetailViewController = PopularDetailViewController(nibName:"PopularDetailViewController", bundle: nil)
        popularDetailViewController.selectedMovie = selectedMovie
        popularDetailViewController.imageUrl = self.viewModel.selectedMovieUrl
        self.navigationController?.pushViewController(popularDetailViewController, animated: true)
         */
        
        return indexPath
    }
    
}
