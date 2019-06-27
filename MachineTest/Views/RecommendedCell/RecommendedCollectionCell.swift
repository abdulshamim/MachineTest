//
//  RecommendedCollectionCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 26/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit
import Kingfisher

class RecommendedCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        
        self.addressContainerView.setCornerRadius(radius: 5.0)
        self.setShadowForAllSide()
        self.containerView.setCornerRadius(radius: 5.0)
    }

    func setUp(data: Recommended) {
        self.nameLabel.text = data.name
        self.addressLabel.text = data.address
        self.buyLabel.text = "Buy"
        self.typeLabel.text = data.property_type
        self.landmarkLabel.text = data.locality
        self.priceLabel.text = data.avg_price
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: URL(string: data.imagePath), placeholder: nil)
    }
}
