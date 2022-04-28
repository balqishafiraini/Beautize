//
//  SkincareViewController.swift
//  Beautize
//
//  Created by Balqis on 26/04/22.
//

import UIKit

class SkincareViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var skincareTable: UITableView!
    
    var productImage = ["sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen", "sunscreen"]
    
    var flagCollection: SkincareProTableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let checkVC = segue.destination as? AddViewController {
            checkVC.accept = {
                self.flagCollection?.acceptData()
                self.flagCollection?.skincareProCollection.reloadData()
                print("bisa nich")
            }
        }
    }
    
    func registerCell() {
        skincareTable.register(UINib(nibName: "SkincareCatTableViewCell", bundle: nil), forCellReuseIdentifier: "SkincareCatCellID")
        skincareTable.register(UINib(nibName: "SkincareProTableViewCell", bundle: nil), forCellReuseIdentifier: "SkincareProCellID")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
        guard let cellCategory = (tableView.dequeueReusableCell(withIdentifier: "SkincareCatCellID", for: indexPath) as? SkincareCatTableViewCell) else { return UITableViewCell() }
            return cellCategory
        } else {
            let cellProducts = (tableView.dequeueReusableCell(withIdentifier: "SkincareProCellID", for: indexPath) as? SkincareProTableViewCell)!
            cellProducts.buttonClicked = {
                self.performSegue(withIdentifier: "goToAdd", sender: nil)
            }
            flagCollection = cellProducts

            return cellProducts
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        else {
            let countItem = productImage.count/2
            let collectionSize = 220*countItem
            return CGFloat(collectionSize)
        }
    }
    
    
}
