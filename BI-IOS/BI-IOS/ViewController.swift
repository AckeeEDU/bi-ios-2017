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
    
    override func loadView() {
        super.loadView()
        
        let fireButton = UIButton(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        fireButton.setTitle("Fire", for: .normal)
        fireButton.setTitleColor(.white, for: .normal)
        fireButton.backgroundColor = .black
        view.addSubview(fireButton)
        self.fireButton = fireButton
        
        let aView = UIView(frame: CGRect(x: 60, y: 150, width: 120, height: 200))
        aView.backgroundColor = UIColor(red: 0.72, green: 0.23, blue: 0.48, alpha: 1)
        aView.layer.cornerRadius = 20
        view.addSubview(aView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fireButton.addTarget(self, action: #selector(fireButtonTapped(_:)), for: .touchUpInside)
    }

    @objc func fireButtonTapped(_ sender: UIButton) {
        let randomIntFrom0to100 = Int(arc4random_uniform(100))
        let randomFloat = Float(arc4random())/Float(UInt32.max)
        print("Fire! \(randomIntFrom0to100)   \(randomFloat)")
        
        // aView.subviews
        // aView.removeFromSuperview()
    }
    
}

