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
    var imageUrl: String?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overviewText: UITextView!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = selectedMovie?.title
        overviewText.text = selectedMovie?.overview
        popularityLabel.text = selectedMovie?.rating?.description ?? "0" + "/10"
        genreLabel.text = "Genre: "
        releaseDateLabel.text = "Release Date: " + (selectedMovie?.releaseDate)!
        runtimeLabel.text = "Duration: "
        
        if (imageUrl != nil) {
            imageView.sd_setImage(with: URL(string: imageUrl!)) { (image, error, type, url) in
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
