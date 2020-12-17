//
//  detailViewController.swift
//  Final
//
//  Created by QingyunLin on 2017/10/22.
//  Copyright © 2020年 rab. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    var curItem: Item?
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if addItemImage.keys.contains((curItem?.itemName)!) {
            imageView.image = addItemImage[(curItem?.itemName)!]
        }
        else {
            imageView.image = UIImage(named: (curItem?.itemName)! + ".jpeg")
        }
        result = result + "Item Name: " + (curItem?.itemName)! + "\n"
        result = result + "Item Price: " + String(describing: (curItem?.itemPrice)!) + "\n"
        result = result + "Item Description: " + (curItem?.itemDescription)! + "\n"
        result = result + "Item Category: " + (curItem?.itemType.name)! + "\n"
        detailTextView.text = result
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func setCurItem(_ item: Item) {
        self.curItem = item
    }
    

    

}
