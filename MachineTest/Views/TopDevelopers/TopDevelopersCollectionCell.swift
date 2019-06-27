//
//  TopDevelopersCollectionCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class TopDevelopersCollectionCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var propertiesCountLabel: UILabel!
    @IBOutlet weak var propertiesLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearEstabLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setShadowForAllSide()
        self.containerView.setCornerRadius(radius: 5.0)
    }

    func setUp(data: TopDeveloper) {
        self.nameLabel.text = data.name
        self.yearEstabLabel.text = data.year_estd
        self.propertiesLabel.text = "Properties"
        self.propertiesCountLabel.text = data.total_properties_count
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: URL(string: data.imagePath), placeholder: nil)
    }
}
