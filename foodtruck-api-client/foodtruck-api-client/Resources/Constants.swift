//
//  Constants.swift
//  foodtruck-api-client
//
//  Created by Ильин Роман on 17.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import Foundation

// Callbacks
// Typealias for callbacks used in Data Service
typealias callback = (_ success: Bool) -> ()

// Base URL

let BASE_API_URL = "http://localhost:3005/api/v1"

// GET all food trucks URL

let GET_ALL_FT_URL = "\(BASE_API_URL)/foodtruck/"

// GET all Reviews for a specific food truck URL

let GET_ALL_FT_REVIEWS = "http://localhost:3005/api/v1/foodtrack/reviews"

// POST add new Food Truck
let POST_ADD_NEW_TRUCK = "http://localhost:3005/api/v1/foodtruck/add"

// POST add new Review for specific truck
let POST_ADD_NEW_REVIEW = "http://localhost:3005/api/v1/foodtrack/reviews/add"

// Boolean auth userDefaults keys
let DEFAULTS_REGISTERED = "isRegistered"
let DEFAULTS_AUTHENTICATED = "isAuthenticated"

// Auth Email
let DEFAULTS_EMAIL = "email"

// Auth Token
let DEFAULTS_TOKEN = "AuthToken"

// Register URL

let POST_REGISTER_ACCOUNT = "http://localhost:3005/api/v1/account/register"

let POST_LOGIN_ACCOUNT = "http://localhost:3005/api/v1/account/login"



























