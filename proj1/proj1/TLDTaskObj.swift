//
//  TLDTaskObj.swift
//  proj1
//
//  Created by Yeshun Lin on 10/19/16.
//  Copyright © 2016 Yeshun Lin. All rights reserved.
//

import UIKit

class TLDTaskObj: NSObject {
    var name: String
    var complete: Bool
    var clearDate : NSDate? = nil
    static var counter: Int = 0
    var timer : NSDate? = nil
    init(input : String) {
        name = input
        complete = false
    }
}
