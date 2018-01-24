//
//  ReviewCell.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 24.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(review: FoodTruckReview) {
        titleLabel.text = review.title
        reviewTextLabel.text = review.text
    }
}
