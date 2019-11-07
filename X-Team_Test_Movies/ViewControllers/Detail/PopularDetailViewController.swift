//
//  PopularDetailViewController.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import UIKit
import SDWebImage

class PopularDetailViewController: UIViewController {

    var selectedMovie: Movie?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overviewText: UITextView!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = selectedMovie?.title
        overviewText.text = selectedMovie?.overview
        popularityLabel.text = MovieAppConstants.detailVCRatingLabelStart + (selectedMovie?.rating?.description ?? "0") + MovieAppConstants.detailVCRatingLabelEnd
        releaseDateLabel.text = "Release Date: " + (selectedMovie?.releaseDate)!
        imageView.sd_setImage(with: URL(string: selectedMovie?.imageFormattedUrl ?? ""))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
