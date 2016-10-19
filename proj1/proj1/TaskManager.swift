//
//  TaskManager.swift
//  proj1
//
//  Created by Yeshun Lin on 10/18/16.
//  Copyright © 2016 Yeshun Lin. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Name"
    var desc = "Description"
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
}
