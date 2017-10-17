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
        
        // Layout definition using basic NSLayoutConstraints
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10)
        let trailing = NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -10)
        let top = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 10)
        let height = NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([leading, trailing, top])
        greenView.addConstraint(height)
        
        // Layout definition using SnapKit
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(greenView.snp.bottom).offset(20)
            make.height.equalTo(200)
        }
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        blueView.snp.makeConstraints { make in
            make.leading.equalTo(redView.snp.trailing).offset(20)
            make.top.height.width.equalTo(redView)
            make.trailing.equalTo(-10)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    }
    
}

