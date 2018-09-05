//
//  ViewController.swift
//  ToDoye
//
//  Created by Ruwaifi Hasan on 27/08/2018.
//  Copyright © 2018 Ruwaifi Hasan. All rights reserved.
//

import UIKit

class TodoyeListViewController: UITableViewController {
    
    let itemArray = ["Find the Fresh Milk", "Buy The Fresh Mil", "Drink Fresh Milk in the Everyday Morning"]

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
// MARK = Teablevide Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    //MARK = Tableview Delegate Mathodes
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
     
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
