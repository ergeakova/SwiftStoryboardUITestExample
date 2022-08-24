//
//  ViewController.swift
//  SwiftStoryboardUITestExample
//
//  Created by Erge Gevher Akova on 24.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "Enter your new TO DO", preferredStyle: .alert)
        alert.addTextField{ textField in
            textField.placeholder = "Enter Item"
        }
        
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else{
                return
            }
            
            self.todoList.insert(inputText, at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }
        
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = todoList[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
