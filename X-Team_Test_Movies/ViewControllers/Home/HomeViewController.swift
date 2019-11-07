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
  
  private let categoriesListService = CategoriesListService()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    categoriesListService.getPopularMovies(pageNumber: 1, success: { result in
        print("got it!")
        }) {
        print("error")
        }
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

