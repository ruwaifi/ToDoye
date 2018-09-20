//
//  ViewController.swift
//  ToDoye
//
//  Created by Ruwaifi Hasan on 27/08/2018.
//  Copyright © 2018 Ruwaifi Hasan. All rights reserved.
//

import UIKit

class TodoyeListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(dataFilePath!)
        
        let newItem = Item()
        newItem.title = "Find Milk"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Milk"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Milk"
        itemArray.append(newItem3)
        
      //  if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
       //     itemArray = items
       // }
   
    }
    
// MARK = Teablevide Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }

    //MARK = Tableview Delegate Mathodes
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
     
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
    
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK= Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoye Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen when click on add item button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
         
         self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New Item"
            textField = alertTextField
        
        }
       
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK - Model Manupulation Methods
    
    func saveItems() {
        let encoda = PropertyListEncoder()
        do {
            let data = try encoda.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
            
        }
        
        self.tableView.reloadData()
    }
    
}

