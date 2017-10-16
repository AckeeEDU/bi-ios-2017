//
//  ViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 09.10.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var fireButton: UIButton!
    weak var contentView: UIView!
    
    override func loadView() {
        super.loadView()
        
        let contentView = UIView(frame: view.bounds)
        view.addSubview(contentView)
        self.contentView = contentView
        
        let fireButton = UIButton(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        fireButton.setTitle("Fire", for: .normal)
        fireButton.setTitleColor(.white, for: .normal)
        fireButton.backgroundColor = .black
        view.addSubview(fireButton)
        self.fireButton = fireButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fireButton.addTarget(self, action: #selector(fireButtonTapped(_:)), for: .touchUpInside)
    }

    @objc func fireButtonTapped(_ sender: UIButton) {
        
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        for _ in 1...20 {
            
            let size = CGFloat(arc4random_uniform(UInt32(view.bounds.width/2)))
            let x = CGFloat(arc4random_uniform(UInt32(view.bounds.width-size)))
            let y = CGFloat(arc4random_uniform(UInt32(view.bounds.height-size)))
            
            let red = CGFloat(arc4random())/CGFloat(UInt32.max)
            let green = CGFloat(arc4random())/CGFloat(UInt32.max)
            let blue = CGFloat(arc4random())/CGFloat(UInt32.max)
            
            let aView = UIView(frame: CGRect(x: x, y: y, width: size, height: size))
            aView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
            aView.layer.cornerRadius = size/2
            contentView.addSubview(aView)
        }
    }
    
}

