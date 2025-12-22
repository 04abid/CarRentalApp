//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var carmenu: CarManager?
    var selectedCar: CarCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CarCell", bundle: nil), forCellWithReuseIdentifier: "CarCell")
        collection.register(UINib(nibName: "selectedCarCell", bundle: nil), forCellWithReuseIdentifier: "selectedCarCell")
        CarDataManager.shared.getCarList()
    }
    
    override func viewDidLayoutSubviews() {
        searchTextField.layer.cornerRadius = searchTextField.frame.height / 2
        searchTextField.clipsToBounds = true
    }
}



extension HomeController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            CarDataManager.shared.carmenu?.categories.count ?? 0
        } else {
            CarDataManager.shared.selectedCar?.cars.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                           cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if indexPath.section == 0 {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCell
               guard  let category = CarDataManager.shared.carmenu?.categories[indexPath.item] else {return cell}
               cell.configure(carCategory: category)
               return cell
           } else {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedCarCell", for: indexPath) as! selectedCarCell
               guard let car =  CarDataManager.shared.selectedCar?.cars[indexPath.item] else { return cell }
               cell.configure(car: car)
               return cell
           }
       }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedCar = CarDataManager.shared.carmenu?.categories[indexPath.item]
            collectionView.reloadSections(IndexSet(integer: 1))
        }
    }
    }


extension HomeController {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 120, height: 149)
        } else {
            return CGSize(width: /*collectionView.frame.width*/ 350, height: 355)
        }
    }
    
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 16
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
        } else {
            return .zero
        }
    }
}
