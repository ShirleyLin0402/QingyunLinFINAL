//
//  newItemViewController.swift
// Final
//
//  Created by QingyunLin on 2017/10/22.
//  Copyright © 2020年 rab. All rights reserved.
//

import UIKit

class newItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    var imageAdded = false
    
    @IBAction func createItem(_ sender: Any) {
        let itemName = textField1.text
        let itemPrice = textField2.text
        let itemDescription = textField3.text
        let itemCategory = textField5.text
        
        if itemName == "" || itemName == nil {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Wrong Name"
            alert.addButton(withTitle: "Understood")
            alert.show()
            return
        }
        
        if itemPrice == "" || itemPrice == nil || !isNumeric(text: itemPrice!){
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Wrong Price"
            alert.addButton(withTitle: "Understood")
            alert.show()
            return
        }
        
        if itemDescription == "" || itemDescription == nil {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Wrong Description"
            alert.addButton(withTitle: "Understood")
            alert.show()
            return
        }
        
        if itemCategory == "" || itemCategory == nil || (itemCategory != "Fruit" && itemCategory != "Meat") {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Wrong Category"
            alert.addButton(withTitle: "Understood")
            alert.show()
            return
        }
        
        if !imageAdded {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Image Needed"
            alert.addButton(withTitle: "Understood")
            alert.show()
            return
        }
        
        var newItem: Item?
        
        if itemCategory == "Fruit" {
            newItem = Item(itemName: itemName!, itemDescription: itemDescription!, itemPrice: Int(itemPrice!)!, itemType: Fruit, store: store)
            store.items.append(newItem!)
            Fruit.items.append(newItem!)
            storeItems = [Fruit.items, Meat.items]
        }
        else {
            newItem = Item(itemName: itemName!, itemDescription: itemDescription!, itemPrice: Int(itemPrice!)!, itemType: Meat, store: store)
            store.items.append(newItem!)
            Meat.items.append(newItem!)
            storeItems = [Fruit.items, Meat.items]
        }
        
        let image = myImageView.image
        addItemImage[itemName!] = image

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
        
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "Create Succeed!"
        alert.addButton(withTitle: "Understood")
        alert.show()
    }
    
    
    func isNumeric(text: String)-> Bool {
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(text.characters).isSubset(of: nums)
    }
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageView.image = image
            imageAdded = true
        }
        else {
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
