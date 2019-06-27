//
//  RecommendedCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 26/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class RecommendedCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var recommended = [Recommended]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(UINib(nibName: "RecommendedCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "RecommendedCollectionCell")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setUp(data: [Recommended]) {
        self.recommended = data
        self.collectionView.reloadData()
    }
}

extension RecommendedCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.recommended.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionCell", for: indexPath) as? RecommendedCollectionCell
        cell?.setUp(data: self.recommended[indexPath.item])
        cell?.backgroundColor = .clear
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 + 100, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension UIView {
    
    func setShadowForAllSide(forTop:Bool = false) {
        setShadowBounds(forTop: forTop)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
    }
    
    func setShadowBounds(forTop:Bool = false) {
        if forTop == true {
            self.layer.shadowOffset = CGSize(width: -2, height: -3)
        } else {
            self.layer.shadowOffset = CGSize(width: 2, height: 3)
        }
        
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3
        self.clipsToBounds = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setCornerRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
