//
//  CarManager.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import Foundation

struct CarManager: Codable {
    let categories: [CarCategory]
}
struct CarCategory: Codable {
    let title: String
    let coverImage: String
    let cars: [Car]
}
struct Car: Codable {
    let brand: String
    let model: String
    let pricePerMonth: String
    let engine: String
    let image: String
    let type: String
    let year: String
}
