//
//  PreSaleViewCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class PreSaleViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var preSales = [PreSale]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(UINib(nibName: "PreSaleCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PreSaleCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(data: [PreSale]) {
        self.preSales = data
        self.collectionView.reloadData()
    }
}

extension PreSaleViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.preSales.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreSaleCollectionViewCell", for: indexPath) as? PreSaleCollectionViewCell
        cell?.setUp(data: self.preSales[indexPath.item])
        cell?.backgroundColor = .clear
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width - 20 , height: self.collectionView.frame.height)
    }
}
