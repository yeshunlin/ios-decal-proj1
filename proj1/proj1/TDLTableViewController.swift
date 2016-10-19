//
//  TDLTableViewController.swift
//  proj1
//
//  Created by Yeshun Lin on 10/19/16.
//  Copyright © 2016 Yeshun Lin. All rights reserved.
//

import UIKit

class TDLTableViewController: UITableViewController {
    
    var todoList = [TLDTaskObj]()
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? TDLNewTaskViewController ,
            let item = sourceViewController.item {
            self.todoList.append(item)
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsMultipleSelection = true
    }
    
    func clearCompleted() {
        for i in 0..<todoList.count {
            let item = todoList[i]
            if item.complete {
                if (Int(Date().timeIntervalSince(item.timer as! Date)) >= 86400) {
                    self.todoList.remove(at: i)
                    TLDTaskObj.counter = TLDTaskObj.counter - 1
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protocell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row].name
        cell.accessoryType = todoList[indexPath.row].complete ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if todoList[indexPath.row].complete == true {
                TLDTaskObj.counter = TLDTaskObj.counter - 1
            }
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
            todoList[indexPath.row].complete = true
            todoList[indexPath.row].timer = Date() as NSDate?
            TLDTaskObj.counter = TLDTaskObj.counter + 1
        } else {
            cell?.accessoryType = .none
            todoList[indexPath.row].complete = false
            todoList[indexPath.row].timer = nil
            TLDTaskObj.counter = TLDTaskObj.counter - 1
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsseg" {
            var i = 0
            for item in todoList {
                if item.complete {
                    if (Int(Date().timeIntervalSince(item.timer as! Date)) < 86400) {
                        i += 1
                    }
                }
            }
        }
    }
    
}
