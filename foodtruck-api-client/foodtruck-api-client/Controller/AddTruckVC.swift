//
//  AddTruckVC.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 19.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class AddTruckVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var foodTypeField: UITextField!
    @IBOutlet weak var avgCostField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var longField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        guard let name = nameField.text, nameField.text != "" else {
            showAlert(with: "Error", message: "Please enter a name")
            return
        }
        guard let foodType = foodTypeField.text, foodTypeField.text != "" else {
            showAlert(with: "Error", message: "Please enter a food type")
            return
        }
        
        guard let avgCost = Double(avgCostField.text!), avgCostField.text != "" else {
            showAlert(with: "Error", message: "Please enter an average cost")
            return
        }
        
        guard let latitude = Double(latField.text!), latField.text != "" else {
            showAlert(with: "Error", message: "Please enter a latitude")
            return
        }
        
        guard let longtitude = Double(longField.text!), longField.text != "" else {
            showAlert(with: "Error", message: "Please enter a longtitude")
            return
        }
        
        DataService.instance.addNewFoodTruck(name, foodtype: foodType, avgcost: avgCost, latitude: latitude, longtitude: longtitude, completion: { Success in
            if Success {
                print("We saved Successfully")
                self.dissmisViewController()
            } else {
                self.showAlert(with: "Error", message: "An Error Occured saving the new food truck")
                print("We didn't save successfully")
            }
        })
        
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        dissmisViewController()
    }
    
    @IBAction func backButtonTapped(sender: UIButton) {
        dissmisViewController()
    }
    
    func dissmisViewController() {
        OperationQueue.main.addOperation {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
