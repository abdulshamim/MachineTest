//
//  FeaturedLocalitiesCollectionCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class FeaturedLocalitiesCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceOfareaLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var projectCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setShadowForAllSide()
        self.containerView.setCornerRadius(radius: 5.0)
    }

    func setUp(data: FeaturedLocalities) {
        self.addressLabel.text = data.name
        self.priceOfareaLabel.text = data.price
        self.projectLabel.text = "Total Projects"
        self.projectCountLabel.text = data.buildings_count
    }
}
