//
//  TDLNewTaskViewController.swift
//  proj1
//
//  Created by Yeshun Lin on 10/19/16.
//  Copyright © 2016 Yeshun Lin. All rights reserved.
//

import UIKit

class TDLNewTaskViewController: UIViewController {

    @IBOutlet weak var done: UIBarButtonItem!
    @IBOutlet weak var newTask: UITextField!
    
    var item : TLDTaskObj?
    
    struct todoList {
        var name : String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != done {
            return
        }
        
        if (newTask.text?.characters.count)! > 0 {
            item = TLDTaskObj(input: newTask.text!)
        }
    }

}
