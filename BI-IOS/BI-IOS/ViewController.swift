//
//  ViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 09.10.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func loadView() {
        super.loadView()
        
        // self.label is defined in Main.storyboard
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    }
    
}

