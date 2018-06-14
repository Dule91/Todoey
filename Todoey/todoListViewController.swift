//
//  ViewController.swift
//  Todoey
//
//  Created by Korisnik on 6/13/18.
//  Copyright © 2018 Korisnik. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

   var itemArray = ["Find Mike", "Buy Egoos", "Destroy"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itmes = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = itmes
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

  override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   print(itemArray[indexPath.row])

    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
    } else {
          tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
    
    
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    
    }
    @IBAction func addButonPressed(_ sender: UIBarButtonItem) {
        var textField  = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // sta ce se desiti kada se pritise additem button
           self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

