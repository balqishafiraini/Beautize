//
//  SkincareProTableViewCell.swift
//  Beautize
//
//  Created by Balqis on 27/04/22.
//

import UIKit

class SkincareProTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var productImage = ["sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen"]
    var productDesc = ["sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen"]
    var productName =  ["sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen"]
    var productCategory =  ["sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen"]
    
    var products = [Skincare]()
    
    var buttonClicked: (() -> Void)?
    
    @IBOutlet weak var skincareProCollection: UICollectionView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        skincareProCollection.register(UINib(nibName: "SkincareProCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SkincareProItemCellID")
        skincareProCollection.isScrollEnabled = false
        
        let countItem = productImage.count/2
        let collectionSize = 220*countItem
        skincareProCollection.frame = CGRect (x: 10, y: 55, width: 370, height: collectionSize)
        
        acceptData()
    }
    
    func acceptData() {
        do {
            let context = appDelegate.persistentContainer.viewContext
            let data = Skincare.fetchRequest()
            let result = try context.fetch(data)
            products = result
        }
        
        catch {
            print(error.localizedDescription)
        }
        
        print(products)
    }
    
    //masalah: mendelegate reload dari viewcontroller = SOLVED
    //masalah: masukin foto
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellSkincarePro = (collectionView.dequeueReusableCell(withReuseIdentifier: "SkincareProItemCellID", for: indexPath) as? SkincareProCollectionViewCell)!
        cellSkincarePro.skincareProIcon.image = UIImage(named: productImage[indexPath.row])
        cellSkincarePro.skincareProName.text = products[indexPath.row].brand
        cellSkincarePro.skincareProDesc.text = products[indexPath.row].name
        cellSkincarePro.skincareProCategory.text = products[indexPath.row].category
        return cellSkincarePro
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let buttonAdd = buttonClicked {
            buttonAdd()
        }
    }
    
}
