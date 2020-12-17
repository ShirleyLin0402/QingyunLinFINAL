//
//  listViewController.swift
//  Final
//
//  Created by QingyunLin on 2017/10/22.
//  Copyright © 2020年 rab. All rights reserved.
//

import UIKit

class listViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var llistView: UITableView!
    @IBOutlet weak var searchListBar: UISearchBar!
    
    var isSearching = false
    
    var searchList:[Item] = []
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchList.count
        }
    
        return curPurchase.items.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "listcell")
        if isSearching {
            cell.textLabel?.text = searchList[indexPath.row].itemName + " " + String(searchList[indexPath.row].itemPrice) + " " + searchList[indexPath.row].itemDescription
            if addItemImage.keys.contains(searchList[indexPath.row].itemName) {
                cell.imageView?.image = addItemImage[searchList[indexPath.row].itemName]
            }
            else {
                var image: UIImage = UIImage(named: searchList[indexPath.row].itemName + ".jpeg")!
                cell.imageView?.image = image
            }
        }
        else {
            cell.textLabel?.text = curPurchase.items[indexPath.row].itemName + " " + String(curPurchase.items[indexPath.row].itemPrice) + " " + curPurchase.items[indexPath.row].itemDescription
            if addItemImage.keys.contains(curPurchase.items[indexPath.row].itemName) {
                cell.imageView?.image = addItemImage[curPurchase.items[indexPath.row].itemName]
            }
            else {
                var image: UIImage = UIImage(named: curPurchase.items[indexPath.row].itemName + ".jpeg")!
                cell.imageView?.image = image
            }

        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as? detailViewController {
            viewController.setCurItem(curPurchase.items[indexPath.row])
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
        
    }
    
    @objc public func updateList() {
        llistView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            updateList()
        }
        else {
            isSearching = true
            searchList = curPurchase.items.filter {$0.itemName == searchBar.text}
            updateList()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var result: String = ""
//        for i in curPurchase.items {
//            result = result + "\n" + i.itemName
//            listTextView?.text = result
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
        
        searchListBar.delegate = self
        searchListBar.returnKeyType = UIReturnKeyType.done
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
