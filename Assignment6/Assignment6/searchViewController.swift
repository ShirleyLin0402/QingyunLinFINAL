//
//  searchViewController.swift
//  Final
//
//  Created by QingyunLin on 2017/10/22.
//  Copyright © 2020年 rab. All rights reserved.

import UIKit

class searchViewController: UIViewController {
    @IBOutlet weak var searchTextView: UITextView!
    @IBOutlet weak var stextField: UITextField!
    @IBAction func SearchItem(_ sender: UIBarButtonItem) {
        let name = stextField?.text
        print(name)
        var have = false
        var result: String = ""
        for i in curPurchase.items {
            if i.itemName == name {
                have = true
                result = result + "Item Name: " + i.itemName + "\n"
                result = result + "Item Price: " + String(i.itemPrice) + "\n"
                result = result + "Item Description: " + i.itemDescription + "\n"
                result = result + "Item Category: " + i.itemType.name + "\n"
                searchTextView?.text = result
            }
        }
        if have {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Search Succeed"
            alert.addButton(withTitle: "Understood")
            alert.show()
        }
        else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "No Item"
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
