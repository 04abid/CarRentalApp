//
//  CarDataManager.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 22.12.25.
//

import Foundation

class CarDataManager {
    static let shared = CarDataManager()
    private init() {}

    var carmenu: CarManager?
    var selectedCar: CarCategory?
    
    var allCars: [Car] {
        CarDataManager.shared.carmenu?.categories .flatMap({$0.cars}) ?? []
    }
    
    func getCarList() {
        guard let url = Bundle.main.url(forResource: "Car", withExtension: "json") else {return}
        
        do {
            let data = try Data(contentsOf: url)
            carmenu = try JSONDecoder().decode(CarManager.self, from: data)
            selectedCar = carmenu?.categories.first
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
