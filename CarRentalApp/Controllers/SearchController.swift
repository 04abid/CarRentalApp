//
//  SearchController.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 22.12.25.
//

import UIKit

class SearchController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    
    
    var allCars: [Car] {
        CarDataManager.shared.carmenu?.categories .flatMap({$0.cars}) ?? []
    }
    var filteredCars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "SearchCell")
        filteredCars = allCars
        searchTextField.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
}
    
    @objc func searchTextChanged() {
        if let text = searchTextField.text?.lowercased() {
            if text.isEmpty {
                filteredCars = allCars
            } else {
              filteredCars = allCars.filter({ car in
                  car.brand.lowercased().contains(text) ||
                  car.model.lowercased().contains(text)
                })
            }
        }
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredCars.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
//        let car = allCars[indexPath.item]
        let filteredCar = filteredCars[indexPath.item]
        cell.configure(car: filteredCar)
        return cell
    }
}

extension SearchController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 350, height: 355)
    }
}
