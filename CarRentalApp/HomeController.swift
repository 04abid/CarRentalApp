//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    var carmenu: [CarManager] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
    }
    
    
    func getCarList() {
        guard let url = Bundle.main.url(forResource: "Car", withExtension: "json") else {return}
        
        do {
            let data = try Data(contentsOf: url)
            carmenu = try JSONDecoder().decode([CarManager].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}
