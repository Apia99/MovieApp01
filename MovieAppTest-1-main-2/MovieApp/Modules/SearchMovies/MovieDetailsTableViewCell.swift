//
//  CustomTableViewCells.swift
//  MovieApp
//
//  Created by Admin on 17/02/2022.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    
    static let identifier = "MovieDetailsTableViewCell"

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
//    @IBOutlet weak var favButton_: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.isAccessibilityElement  = true
        titleLabel.accessibilityHint = "Title name of the Movie selected"
        overviewLabel.isAccessibilityElement = true
        overviewLabel.accessibilityHint = "Overview information about the Movie"
        
    }
    
    override func prepareForReuse() {
        self.movieImageView.image = nil
    }
    func configureCell(movieRecord:MovieRecord) {
        titleLabel.text = movieRecord.name
        overviewLabel.text = movieRecord.overView
    }
    
    
////    @IBAction func favButton(_ sender: UIButton) { print("Item #\(sender.tag) was selected as a favorite")
//    }
    
}


        
