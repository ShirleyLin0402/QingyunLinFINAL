//
//  addViewController.swift
//  Final
//
//  Created by QingyunLin on 2017/10/22.
//  Copyright © 2020年 rab. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let itemName = textField1?.text
        let itemPrice = textField2?.text
        let itemDescription = textField3?.text
        let itemStore = textField4?.text
        let itemCategory = textField5?.text
        var have = false
        var item: Item?
        for i in store.items {
            if itemName! == i.itemName && Int(itemPrice!)! == i.itemPrice && itemDescription! == i.itemDescription && itemStore == i.store.name && itemCategory == i.itemType.name{
                have = true
                item = i
            }
        }
        if have {
            store.items = store.items.filter {$0.itemName != itemName}
            Fruit.items = Fruit.items.filter {$0.itemName != itemName}
            Meat.items = Meat.items.filter {$0.itemName != itemName}
            storeItems = [Fruit.items, Meat.items]
            curPurchase.items.append(item!)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Add Succeed"
            alert.addButton(withTitle: "Understood")
            alert.show()
        }
        else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "No match item"
            alert.addButton(withTitle: "Understood")
            alert.show()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField2.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
