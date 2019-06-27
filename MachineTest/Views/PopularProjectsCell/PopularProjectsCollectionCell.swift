//
//  PopularProjectsCollectionCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class PopularProjectsCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setShadowForAllSide()
        self.containerView.setCornerRadius(radius: 5.0)
    }

    func setUp(data: PopularProjects) {
        self.addressLabel.text = data.address
        self.nameLabel.text = data.name
        self.typeLabel.text = data.type
        self.priceLabel.text = data.price
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: URL(string: data.imagePath), placeholder: nil)
    }
}
