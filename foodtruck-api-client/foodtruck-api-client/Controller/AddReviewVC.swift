//
//  AddReviewVC.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 24.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class AddReviewVC: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var reviewTitleField: UITextField!
    @IBOutlet weak var reviewTextField: UITextView!
    
    var selectedFoodTruck: FoodTruck?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let truck = selectedFoodTruck {
            headerLabel.text = truck.name
        } else {
            headerLabel.text = "Error"
        }
        
        
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        dismissViewController()
    }
    
    @IBAction func backButtonTapped(sender: UIButton) {
        dismissViewController()
    }
    
    @IBAction func addReviewButtonTapped(sender: UIButton) {
        guard let truck = selectedFoodTruck else {
            showAlert(with: "Error", message: "Could not get selected truck")
            return
        }
        
        guard let title = reviewTitleField.text, reviewTitleField.text != "" else {
            showAlert(with: "Error", message: "Please enter a title for your review")
            return
        }
        guard let reviewText = reviewTextField.text, reviewTextField.text != "" else {
            showAlert(with: "Error", message: "Please enter some text for your review")
            return
        }
        
        DataService.instance.addNewReview(truck.id, title: title, text: reviewText, completion: { Success in
                if Success {
                    print("We saved successfully")
                    DataService.instance.getAllReviewsForTruck(for: truck)
                    self.dismissViewController()
                } else {
                    self.showAlert(with: "Error", message: "An Error occurred saving the new review")
                    print("Save was unsuccessful")
                }
            })
    }
    
    func dismissViewController() {
        OperationQueue.main.addOperation {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Error", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    

}
