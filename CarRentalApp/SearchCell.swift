//
//  SearchCell.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 22.12.25.
//

import UIKit

class SearchCell: UICollectionViewCell {
    @IBOutlet private weak var carNameLabel: UILabel!
    @IBOutlet private weak var carModelLabel: UILabel!
    @IBOutlet private weak var carEngineLabel: UILabel!
    @IBOutlet private weak var carRenPriceLabel: UILabel!
    @IBOutlet private weak var carYearLabel: UILabel!
    @IBOutlet private weak var carEngineLabel2: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0.1, height: 4)
        layer.shadowRadius = 10
    }
    
    func configure(car: Car) {
        carNameLabel.text = car.brand
        carModelLabel.text = car.model
        carEngineLabel.text = "Engine"
        carRenPriceLabel.text = car.pricePerMonth
        carYearLabel.text = car.year
        carEngineLabel2.text = car.engine
        carImage.image = UIImage(named: car.image)
        
    }

}
