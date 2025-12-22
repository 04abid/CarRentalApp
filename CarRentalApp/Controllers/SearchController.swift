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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "SearchCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allCars.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let car = allCars[indexPath.item]
        cell.configure(car: car)
        return cell
    }
}

extension SearchController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 350, height: 355)
    }
}
