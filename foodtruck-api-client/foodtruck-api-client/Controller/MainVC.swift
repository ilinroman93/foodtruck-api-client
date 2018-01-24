//
//  MainVC.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 17.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var logInVC: LogInVC?
    
    var dataService = DataService.instance
    var authService = AuthService.instance

    override func viewDidLoad() {
        super.viewDidLoad()

        dataService.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.getAllFoodTrucks()
    }
    
    func showLogInVC() {
        logInVC = LogInVC()
        logInVC?.modalPresentationStyle = UIModalPresentationStyle.formSheet
        self.present(logInVC!, animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        if AuthService.instance.isAuthenticated == true {
            performSegue(withIdentifier: "showAddTruckVC", sender: self)
        } else {
            showLogInVC()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! DetailsVC
                destinationViewController.selectedFoodTruck = DataService.instance.foodTrucks[indexPath.row]
            }
        }
    }

}

extension MainVC: DataServiceDelegate {
    func truckLoaded() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    func reviewsLoaded() {
        // Do nothing
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.foodTrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTruckCell", for: indexPath) as? FoodTruckCell {
            cell.configureCell(truck: dataService.foodTrucks[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}


