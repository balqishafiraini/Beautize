//
//  SkincareCatCollectionViewCell.swift
//  Beautize
//
//  Created by Balqis on 26/04/22.
//

import UIKit

class SkincareCatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var skincareCatLabel: UILabel!
    @IBOutlet weak var skincareCatIcon: UIImageView!
    
    @IBOutlet weak var backgroundWhite: UIImageView! {
        didSet {
            backgroundWhite.layer.cornerRadius = 20
            backgroundWhite.layer.masksToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
