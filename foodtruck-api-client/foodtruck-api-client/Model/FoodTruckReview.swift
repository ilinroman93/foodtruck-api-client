//
//  FoodTruckReview.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 17.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import Foundation

struct FoodTruckReview {
    var id: String = ""
    var title: String = ""
    var text: String = ""
    
    static func parseReviewJSONData(data: Data) -> [FoodTruckReview] {
        var foodTruckReviews = [FoodTruckReview]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            // Parse JSON
            if let reviews = jsonResult as? [Dictionary<String, AnyObject>] {
                for review in reviews {
                    var newReview = FoodTruckReview()
                    newReview.id = review["_id"] as! String
                    newReview.title = review["title"] as! String
                    newReview.text = review["text"] as! String
                    
                    foodTruckReviews.append(newReview)
                }
            }
            
        } catch let err {
            print(err)
        }
        
        return foodTruckReviews
    }
}
