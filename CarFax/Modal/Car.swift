//
//  Car.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import Foundation

struct Car: Decodable {
    let listings: [CarDetails]
}

struct CarDetails: Decodable {
    let year: Int
    let make: String
    let model: String
    let trim: String
    
    let mileage: Int
    let currentPrice: Int
    
    let dealer: Dealer
    let images: Images
}

struct Dealer: Decodable {
    let city: String
    let state: String
    let phone: String
}

struct Images: Decodable {
    let large: [String]
}
