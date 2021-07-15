//
//  API.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import Foundation

enum API {
    case requestCarListings
    
    func url() -> URL? {
        switch self {
            case .requestCarListings:
                return URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json")
        }
    }
}
