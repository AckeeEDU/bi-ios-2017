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
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        // Layout definition using basic NSLayoutConstraints
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10)
        let trailing = NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -10)
        let top = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 10)
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
        
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(blueView.snp.bottom)
        }
        
        let nameLabel = UILabel()
        nameLabel.text = "Jan Mísař"
        nameLabel.backgroundColor = .yellow
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.top.equalTo(imageView)
            make.trailing.equalTo(-10)
        }
        nameLabel.setContentHuggingPriority(.required, for: .horizontal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "ViewController"
        tabBarItem.title = "ViewController"
        
        print("ViewController did load.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController will appear.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController did appear.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController will disappear.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController did disappear.")
    }
}

