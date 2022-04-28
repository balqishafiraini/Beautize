//
//  SkincareCatTableViewCell.swift
//  Beautize
//
//  Created by Balqis on 26/04/22.
//

import UIKit

class SkincareCatTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var imageCat = ["cleanser", "micellarWater", "facialWash", "exfoliatingToner", "hydratingToner", "essence", "serum", "eyecream", "eyeserum", "moisturizer", "sunscreen"]
    var labelCat = ["Cleanser", "Micellar Water", "Facial Wash", "Exfolitating Toner", "Hydrating Toner", "Essence", "Face Serum", "Eyecream", "Eyeserum", "Moisturizer", "Sunscreen"]

    
    @IBOutlet weak var skincareCatCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        skincareCatCollection.register(UINib(nibName: "SkincareCatCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SkincareCatItemCellID")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCat.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellSkincareCat = (collectionView.dequeueReusableCell(withReuseIdentifier: "SkincareCatItemCellID", for: indexPath) as? SkincareCatCollectionViewCell)!
        cellSkincareCat.skincareCatIcon.image = UIImage(named: imageCat[indexPath.row])
        cellSkincareCat.skincareCatLabel.text = labelCat[indexPath.row]
        return cellSkincareCat
    }
    
}
