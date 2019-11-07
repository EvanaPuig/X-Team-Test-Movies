//
//  CategoriesCustomCell.swift
//  X-Team_Test_Movies
//
//  Created by Evana Margain Puig on 01/11/19.
//  Copyright © 2019 Evana_Margain. All rights reserved.
//

import UIKit
import SDWebImage

class CategoriesCustomCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var movieListCellViewModel : CategoriesCustomCellViewModel? {
        didSet {
            nameLabel.text = movieListCellViewModel?.titleText
            popularityLabel.text = "\(MovieAppConstants.detailVCRatingLabelStart) \(movieListCellViewModel?.popularityText ?? "0.0")"
            mainImageView?.sd_setImage(with: URL(string: movieListCellViewModel?.imageUrl ?? "" ))
        }
    }
}

