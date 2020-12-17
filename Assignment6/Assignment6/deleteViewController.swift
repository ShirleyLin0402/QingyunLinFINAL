//
//  deleteViewController.swift
//  Final
//
//  Created by QingyunLin on 2017/10/22.
//  Copyright © 2020年 rab. All rights reserved.

import UIKit

class deleteViewController: UIViewController {
    @IBOutlet weak var dtextField: UITextField!
    
    
    @IBAction func DeleteItem(_ sender: UIBarButtonItem) {
        var have = false
        let name = dtextField?.text
        for i in curPurchase.items {
            if i.itemName == name {
                have = true
                let item = curPurchase.items.filter {$0.itemName == name}
                curPurchase.items = curPurchase.items.filter {$0.itemName != name}
                store.items = store.items + item
                if item[0].itemType.name == "Fruit" {
                    Fruit.items.append(item[0])
                }
                else {
                    Meat.items.append(item[0])
                }
                storeItems = [Fruit.items, Meat.items]
            }
        }
        if have {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Delete Succeed"
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
