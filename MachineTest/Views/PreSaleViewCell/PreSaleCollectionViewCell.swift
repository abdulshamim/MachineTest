//
//  PreSaleCollectionViewCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class PreSaleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setShadowForAllSide()
        self.containerView.setCornerRadius(radius: 5.0)
        self.startButton.setCornerRadius(radius: startButton.frame.size.height / 2)
    }

    func setUp(data: PreSale) {
        self.addressLabel.text = data.address
        self.priceLabel.text = data.price
        self.typeLabel.text = data.name
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: URL(string: data.imagePath), placeholder: nil)
    }
}
