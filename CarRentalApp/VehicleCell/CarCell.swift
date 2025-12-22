//
//  CarCell.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import UIKit

class CarCell: UICollectionViewCell {
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var carTypeLabel: UILabel!
    @IBOutlet private weak var carCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 10
    }
    
    func configure(carCategory: CarCategory) {
        carImage.image = UIImage(named: carCategory.coverImage)
        carTypeLabel.text = carCategory.title
        carCountLabel.text = "\(carCategory.cars.count)"
    }

    
}
