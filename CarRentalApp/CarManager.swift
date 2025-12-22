//
//  CarManager.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import Foundation

struct CarManager: Codable {
    let Cars: [Car]
}

struct Car: Codable {
    let carType: String
    let carInfo: CarInfo
}

struct CarInfo: Codable {
    let carModel: String
    let carRentPrice: String
    let carEngine: String
}
