//
//  AddViewController.swift
//  Beautize
//
//  Created by Balqis on 27/04/22.
//

import UIKit


class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var brandField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBOutlet weak var showPict: UIImageView!
    @IBOutlet weak var addPict: UIButton!
    var imagePicker = UIImagePickerController()

    
    var pickerData: [String] = [String]()
    
    var category: String = ""
    
    var accept: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        pickerData = ["Sunscreen", "Facial Wash", "Exfoliating Toner", "Hydrating Toner", "Cleanser", "Essence", "Serum", "Eyecream", "Eyeserum", "Micellar Water", "Cleanser", "Moisturizer"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = pickerData[row]
        print("BISA \(category)")
    }
    
    
    @IBAction func uploadPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    print("Button capture")

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
                }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
            self.dismiss(animated: true, completion: { () -> Void in

            })

            showPict.image = image
        }
    
    @IBAction func addProduct(_ sender: Any) {
        let brand = brandField.text
        let name = nameField.text
        let context = appDelegate.persistentContainer.viewContext
        
        let product = Skincare(context: context)
        product.category = category
        product.name = name
        product.brand = brand
        
        do {
            context.insert(product)
            try context.save()
        }
        catch {
            
        }
        
        let alert = UIAlertController (title: "Congrats", message: "Product added!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
        if let accepted = accept {
            accepted()
        }
    }
}
