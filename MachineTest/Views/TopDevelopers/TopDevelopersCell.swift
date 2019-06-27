//
//  TopDevelopersCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class TopDevelopersCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var topDevelopers = [TopDeveloper]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(UINib(nibName: "TopDevelopersCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "TopDevelopersCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    
    }
    
    func setUp(data: [TopDeveloper]) {
        self.topDevelopers = data
        self.collectionView.reloadData()
    }
}

extension TopDevelopersCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.topDevelopers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopDevelopersCollectionCell", for: indexPath) as? TopDevelopersCollectionCell
        cell?.setUp(data: self.topDevelopers[indexPath.item])
        cell?.backgroundColor = .clear
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
