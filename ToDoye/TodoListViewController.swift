//
//  ViewController.swift
//  ToDoye
//
//  Created by Ruwaifi Hasan on 27/08/2018.
//  Copyright © 2018 Ruwaifi Hasan. All rights reserved.
//

import UIKit

class TodoyeListViewController: UITableViewController {
    
    var itemArray = ["Find the Fresh Milk", "Buy The Fresh Mil", "Drink Fresh Milk in the Everyday Morning"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
   
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
    
    //MARK= Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoye Iteem", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen when click on add item button on our UIAlert
            
            self.itemArray.append(textField.text!)
         
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArry")
            
          self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"
            textField = alertTextField
        
        }
       
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

