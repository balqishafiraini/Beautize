//
//  SkincareProCollectionViewCell.swift
//  Beautize
//
//  Created by Balqis on 27/04/22.
//

import UIKit

class SkincareProCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var skincareProIcon: UIImageView!
    
    @IBOutlet weak var skincareProCategory: UILabel!
    @IBOutlet weak var skincareProDesc: UILabel!
    @IBOutlet weak var backgroundWhite: UIImageView! {
        didSet {
            backgroundWhite.layer.cornerRadius = 20
            backgroundWhite.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var skincareProName: UILabel!
    
    @IBOutlet weak var backgroundPurple: UIImageView! {
        didSet {
            backgroundPurple.layer.cornerRadius = 10
            backgroundPurple.layer.masksToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
