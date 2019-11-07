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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let categoriesListService = CategoriesListService()
    lazy var viewModel: CategoriesListViewModel = {
        return CategoriesListViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchConfiguration()
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

