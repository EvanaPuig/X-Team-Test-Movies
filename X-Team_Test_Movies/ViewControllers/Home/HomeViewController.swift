//
//  HomeViewController.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  private let categoriesListService = CategoriesListService()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    categoriesListService.getPopularMovies(pageNumber: 1, success: { result in
      print("got it!")
    }) {
      print("error")
    }
  }


}

