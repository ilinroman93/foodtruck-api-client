//
//  ReviewsVC.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 24.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedFoodTruck: FoodTruck?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        if let truck = selectedFoodTruck {
            nameLabel.text = truck.name
            DataService.instance.getAllReviewsForTruck(for: truck)
        }
        
        
    }

    @IBAction func backButtonTapped(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }

}

extension ReviewsVC: DataServiceDelegate {
    func truckLoaded() {
        
    }
    
    func reviewsLoaded() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
}

extension ReviewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell {
            cell.configureCell(review: DataService.instance.reviews[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
