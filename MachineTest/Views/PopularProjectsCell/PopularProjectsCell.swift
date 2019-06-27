//
//  PopularProjectsCell.swift
//  MachineTest
//
//  Created by Abdul Shamim on 27/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class PopularProjectsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var popularProjects = [PopularProjects]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(UINib(nibName: "PopularProjectsCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PopularProjectsCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(data: [PopularProjects]) {
        self.popularProjects = data
        self.collectionView.reloadData()
    }
    
}

extension PopularProjectsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.popularProjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularProjectsCollectionCell", for: indexPath) as? PopularProjectsCollectionCell
        cell?.setUp(data: self.popularProjects[indexPath.item])
        cell?.backgroundColor = .clear
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width - 60 , height: 135)
    }
}
