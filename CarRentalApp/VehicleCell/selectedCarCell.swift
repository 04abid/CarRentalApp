//
//  selectedCarCell.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 22.12.25.
//

import UIKit

class selectedCarCell: UICollectionViewCell {
    @IBOutlet private weak var carNameLabel: UILabel!
    @IBOutlet private weak var carModelLabel: UILabel!
    @IBOutlet private weak var carEngineLabel: UILabel!
    @IBOutlet private weak var rentPriceLabel: UILabel!
    @IBOutlet private weak var carYearLabel: UILabel!
    @IBOutlet private weak var carEngineLabel2: UILabel!
    @IBOutlet private weak var carImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 10
    }
    
    func configure (car: Car) {
        carNameLabel.text = car.brand
        carModelLabel.text = car.model
        carEngineLabel.text = "Engine"
        rentPriceLabel.text = car.pricePerMonth
        carEngineLabel2.text = car.engine
        carImage.image = UIImage(named: car.image)
        carYearLabel.text = car.year
    }

}
