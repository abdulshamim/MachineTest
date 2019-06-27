//
//  BlogsCollectionCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class BlogsCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setShadowForAllSide()
        self.containerView.setCornerRadius(radius: 5.0)
    }
    
    func setUp(data: Blogs) {
        self.nameLabel.text = data.name
        self.publishedDateLabel.text = data.publish_date
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: URL(string: data.imagePath), placeholder: nil)
    }

}
