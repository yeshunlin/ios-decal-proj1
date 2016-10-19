//
//  TDLStatsViewController.swift
//  proj1
//
//  Created by Yeshun Lin on 10/19/16.
//  Copyright © 2016 Yeshun Lin. All rights reserved.
//

import UIKit

class TDLStatsViewController: UIViewController {

    var numCompleted = TLDTaskObj.counter
    @IBOutlet weak var taskCompleted: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskCompleted.text = String(numCompleted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
